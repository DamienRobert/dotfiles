#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <cairo.h>
#include <cairo-pdf.h>

#define PI 3.141592653589793238462643383

/*
# From Cigaes, see ens.forum.alt.bavardage:45860
gcc -Wall -Wextra -std=c99 -O2 -o plan_triangul \
  $(pkg-config --cflags --libs cairo) plan_triangul.c
*/

#define POINT(n, x0, y0) [n - 'A'] = { x0, y0 }

static void
draw_points(cairo_t *cr, double points[][2], char *script)
{
    int n;
    double lw, col[3];

    while (*script != 0) {
        if (*script == '[') {
            for (script++; *script != 0 && *script != ']'; script++) {
                n = *script - 'A';
                cairo_line_to(cr, -points[n][0], -points[n][1]);
            }
            cairo_stroke(cr);
            if (*script == ']')
                script++;
        } else if (sscanf(script, " w=%lf %n", &lw, &n) >= 1) {
            cairo_set_line_width(cr, lw);
            script += n;
        } else if (sscanf(script, " c=%lf:%lf:%lf %n",
                &col[0], &col[1], &col[2], &n) >= 3) {
            cairo_set_source_rgb(cr, col[0], col[1], col[2]);
            script += n;
        } else {
            fprintf(stderr, "Syntax error near \"%s\"\n", script);
            exit(1);
        }
    }
}

void
distance(int dump, double points[][2], double *r, int p1, int p2, double d)
{
    double rd;

    p1 -= 'A';
    p2 -= 'A';
    rd = hypot(points[p1][0] - points[p2][0], points[p1][1] - points[p2][1]);
    if (dump)
        printf("%c%c = %4.1f vs %4.1f  (%+4.2f)\n",
            p1 + 'A', p2 + 'A', rd, d, rd - d);
    *r += (d - rd)  * (d - rd);
}

double
eval(int dump, double points[][2])
{
    double r = 0;

    distance(dump, points, &r, 'B', 'C', 23.6 + 1.6);
    distance(dump, points, &r, 'C', 'N', 16.2);
    distance(dump, points, &r, 'N', 'B', 23.6 + 1.6 - 16.2);
    distance(dump, points, &r, 'P', 'B',  1.0);
    distance(dump, points, &r, 'J', 'O',  1.6);
    distance(dump, points, &r, 'K', 'P',  1.6);
    distance(dump, points, &r, 'P', 'O',  2.4);
    distance(dump, points, &r, 'K', 'J',  2.4);
    distance(dump, points, &r, 'K', 'O',  hypot(1.6, 2.4));
    distance(dump, points, &r, 'J', 'P',  hypot(1.6, 2.4));
    distance(dump, points, &r, 'O', 'B',  3.4);
    distance(dump, points, &r, 'A', 'O', 11.9); //wrong; and AOPB aligned
    distance(dump, points, &r, 'J', 'N',  8.6);
    distance(dump, points, &r, 'A', 'H',  5.3);
    distance(dump, points, &r, 'A', 'I',  6.0);
    distance(dump, points, &r, 'I', 'H',  5.2);
    distance(dump, points, &r, 'I', 'G',  5.3);
    distance(dump, points, &r, 'G', 'H',  6.1);
    distance(dump, points, &r, 'E', 'H', 10.9);
    distance(dump, points, &r, 'F', 'G',  6.9);
    distance(dump, points, &r, 'F', 'E',  2.2);
    distance(dump, points, &r, 'E', 'D',  9.9);
    distance(dump, points, &r, 'D', 'F',  hypot(2.2, 9.9));
    distance(dump, points, &r, 'D', 'M', 15.2);
    distance(dump, points, &r, 'M', 'C',  5.0);
    distance(dump, points, &r, 'D', 'C', 15.2 + 5.0);
    distance(dump, points, &r, 'M', 'H', 23.8); // ?
    distance(dump, points, &r, 'L', 'M',  7.6);
    distance(dump, points, &r, 'L', 'C', 11.3);
    distance(dump, points, &r, 'L', 'N', 14.5);
    distance(dump, points, &r, 'L', 'J', 19.3);
    distance(dump, points, &r, 'L', 'H', 16.5);
    distance(dump, points, &r, 'L', 'E', 10.8);
    distance(dump, points, &r, 'L', 'D', 11.3);
    return r;
}

static void
create_surface(const char *filename, cairo_surface_t **surface, cairo_t **cr)
{
    *surface = cairo_pdf_surface_create(filename,
        29 * 72 / 2.54, 24 * 72 / 2.54);
    *cr = cairo_create(*surface);
    cairo_set_source_rgb(*cr, 0, 0, 0);
    cairo_set_line_width(*cr, 0.1);
    cairo_scale(*cr, 72 / 2.54, 72 / 2.54);
    cairo_translate(*cr, 27, 14);
}

int
main(void)
{
#define N 16
    double points[N + 4][2] = {
        POINT('A',  0.0, -4.0),
        POINT('B',  0.0, 15.3),
        POINT('C', 24.6, 15.3),
        POINT('D', 24.6, -4.9),
        POINT('E', 14.7, -4.9),
        POINT('F', 14.7, -7.1),
        POINT('G',  7.8, -7.1),
        POINT('H',  3.5, -3.8),
        POINT('I',  2.8, -8.0),
        POINT('J',  1.6, 11.9),
        POINT('K',  1.6, 14.3),
        POINT('L', 18.0,  5.0),
        POINT('M', 24.6, 10.3),
        POINT('N',  7.4, 15.3),
        POINT('O',  0.0, 11.9),
        POINT('P',  0.0, 14.3),
    };
    double grad[N][2];
    const double delta = 0.001;
    const double speed = 0.1;
    double d1, d2, t;
    cairo_surface_t *surface;
    cairo_t *cr;
    unsigned page, i;

    create_surface("/tmp/plan_conv.pdf", &surface, &cr);
    for (page = 0; page <= 1 << 16; page++) {
        if ((page & (page - 1)) == 0) {
            draw_points(cr, points,
                "w=0.10 c=0:0:0 [BCDEFGH]"
                "w=0.05 [AB][HA]"
                "w=0.01 c=0.6:0.6:0.6 [LE][LM][LN][LJ][OJKP][IG][IH][IA]"
                );
            cairo_show_page(cr);
            printf("%d\n", page);
        }
        for (i = 0; i < 2 * N; i++) {
            t = points[i / 2][i % 2];
            points[i / 2][i % 2] = t - delta;
            d1 = eval(0, points);
            points[i / 2][i % 2] = t + delta;
            d2 = eval(0, points);
            points[i / 2][i % 2] = t;
            grad[i / 2][i % 2] = (d2 - d1) / (2 * delta);
        }
        grad[0][0] = 0;
        grad[0][1] = 0;
        grad[1][0] = 0;
        for (i = 0; i < 2 * N; i++)
            points[i / 2][i % 2] -= speed * grad[i / 2][i % 2];
    }
    cairo_destroy(cr);
    cairo_surface_destroy(surface);

    eval(1, points);
    /* 1m between line and boundary, 4m between boundary and easement */
    points[N + 0][0] = points[0][0] + 1;
    points[N + 0][1] = points[0][1] + 0;
    points[N + 1][0] = points[1][0] + 1;
    points[N + 1][1] = points[1][1] + 0.1;
    points[N + 2][0] = points[0][0] + 5;
    points[N + 2][1] = points[0][1] + 0.1;
    points[N + 3][0] = points[1][0] + 5;
    points[N + 3][1] = points[1][1] + 0.4;
    create_surface("/tmp/plan_final.pdf", &surface, &cr);
    draw_points(cr, points,
        "w=0.10 c=0:0:0 [BCDEFGH]"
        "w=0.05 [AB][HA][QR][ST]"
        );
    cairo_set_source_rgb(cr, 0, 0, 0.5);
    cairo_set_line_width(cr, 0.05);
    cairo_save(cr);
    cairo_translate(cr, -1, 8);
    cairo_rotate(cr, -30 * PI / 180);
    cairo_move_to(cr, 0, 0);
    cairo_line_to(cr, 0, -2);
    cairo_rel_move_to(cr, +0.1, +0.2);
    cairo_rel_line_to(cr, -0.1, -0.2);
    cairo_rel_line_to(cr, -0.1, +0.2);
    cairo_stroke(cr);
    cairo_restore(cr);
    cairo_destroy(cr);
    cairo_surface_destroy(surface);
    return 0;
}
