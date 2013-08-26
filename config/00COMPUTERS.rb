#!/usr/bin/env ruby
require 'shellwords'

#from: require 'dr/shell'
module Shell
  def self.local_var(hash)
    puts "local #{hash.keys.map {|s| s.upcase}.join(" ")}"
  end
  def self.export(hash)
    hash.each do |k,v|
      print k.to_s.upcase,"="
      case v
      when String
        puts v.shellescape
      when Array
        puts "(#{v.map {|i| i.shellescape}.join(' ')})"
      when nil
        puts
      else
        puts v.to_s.shellescape
      end
    end
  end
end

module Computers
  #used for syst/etc/generate.sh to generate all config files
  ListArchlinux=%w(Gondolin Feanor Numenor Valinor Durin)
  Alias={"ens" => "phare"}

  #lists of computers to synchronize
  ListPerso=ListArchlinux + %W(FleurBleue)
  ListSync=%w(phare imb 4a)
  ListProgs=%w(bbq mygale)
  ListExtra=%w(oimb) #this is not an alias because of sshunison
  ListUnison=ListPerso + ListSync + ListProgs
  ListAll=ListUnison + ListExtra

  def self.infos(name)
    return Computer.new(name).infos
  end
end

class Computer
  attr_reader :name,:origname,:infos
  include Computers

  #find the canonical name of the computer
  def normalize(param)
    return nil unless param
    name=ListAll.find {|v| v.downcase == param.downcase }
    (name=Alias.find {|k,v| k.downcase == param.downcase }) && name=name[1] unless name
    return name
  end
  #check if it is in the Computers list
  def check
    return ListAll.include?(@name)
  end

  def initialize(name)
    @origname=name
    @name=normalize(name) || name
    @infos = get_infos
  end
  def to_s
    @name
  end
  def ===(item)
    case item
    when String
      @name==Computer.new(item).name
    when Computer
      @name==item.name
    end
  end

  #find if name or alias is in list (or alias)
  def in?(list)
    list.any? do |i|
      self.===(i)
    end
  end

  #informations on computers
  def get_infos
    infos={
      :computerhostname => @name, :homepath => "/home/robert",
      :unisonpath => nil, :sshunison => @name, :unisontype => [ "minimal" ], :unisoninit => "minimal",
    }
  
    if ListArchlinux.include?(@name)
      infos.update({
        :homepath => "/home/dams",
        :sshunison => name.downcase,
        :server => false, :laptop => false,
        :arch => "i686", :cputype => nil, :lang => "fr",
        :ethname => "eth0", :wlanname => "wlan0",
        :mkinitcpio_modules => [], :mkinitcpio_hooks => ["resume"]
      })
    #:server pour packages.rb, :laptop pour 02commitetc
    #cputype: était utilisé pour charger le bon acpifreq module, mais c'est fait automatiquement maintenant
    # lang, ethname, wlanname: pas utilisé
    end
    if ListPerso.include?(@name)
      infos[:unisontype]=%w[common data]
      infos[:unisoninit]="common"
      infos[:homepath]="/home/dams"
    end
    if ListSync.include?(@name)
      infos[:unisontype]=%w[common data]
      infos[:unisoninit]="common"
    end
    if ListProgs.include?(@name)
      infos[:unisontype]=%w[deploy sh]
      infos[:unisoninit]="sh"
    end

    case @name
    when "imb"
      infos.update({
        :sshunison => "imbunison",
        :homepath => "/home/imb/drobert"
      })
    when "oimb"
      infos=Computers.infos("imb").update({ :sshunison => "oimbunison" })
    when "phare"
      infos.update({ :sshunison => "phare2" })
    when "4a"
      infos.update({ :sshunison => "4a2" })
    when "Feanor"
      infos.update({
        :arch => "x86_64",
        :cputype => "acpi-cpufreq",
        :mkinitcpio_hooks => [],
        :mkinitcpio_modules => ["intel_agp", "i915"]
      })
    when "Valinor"
      infos.update({
        :arch => "x86_64",
        :cputype => "acpi-cpufreq",
        :mkinitcpio_modules => ["nouveau"],
        :laptop => true
      })
    when "Numenor"
      infos.update({
        :cputype => "powernow-k8",
        :laptop => true,
        :mkinitcpio_modules => ["intel_agp", "i915"]
      })
      infos[:mkinitcpio_hooks].push("lvm2")
    when "Gondolin"
      infos.update({
        :server => true,
        :laptop => true
      })
      infos[:mkinitcpio_hooks].push("lvm2")
    when "Durin"
      infos.update({
        :server => true,
        :wlanname => nil,
        :arch => "armv6l",
        :unisonpath => "/usr/local/bin/unison"
      })
    end

    if ! ListArchlinux.include?(@name)
      infos.update({
        :unisonpath => "#{infos[:homepath]}/bin/unison"
      })
    end

    return infos
  end
end

if __FILE__ == $0
  export=ARGV.delete("--export")
  exportlocal=ARGV.delete("--export-local")
  if ARGV[0] then
    comp=Computer.new(ARGV[0])
    abort "#{comp} not found in Computers list" unless comp.check
    infos=Computers.infos(ARGV[0])
    if export
      Shell.export(infos)
    else
      puts infos
    end
  else
    computers={
      :Computers => Computers::ListAll,
      :Perso_Archlinux => Computers::ListArchlinux,
      :List_Perso => Computers::ListPerso,
      :List_Sync => Computers::ListSync,
      :List_Progs => Computers::ListProgs
    }
    if export
      Shell.export(computers)
    elsif exportlocal
      Shell.local_var(computers)
      Shell.export(computers)
    else
      puts computers
    end
  end
end
