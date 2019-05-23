module.exports = ({ file, options, env }) => ({
  plugins: [
    require('autoprefixer')() //<- Can pass a custom browser list
  ]
})
