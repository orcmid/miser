/* m230900c2.c 0.0.1                UTF-8                         2026-02-19
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *                     IMPLEMENTATION OF OB COMPARISON
 *                     ===============================
 *
 *   This is a pseudo (semi-COM C/C++) determination that two ob-cells are
 *   representations of the same ob.
 *
 *   This derivation from m230900c1.c Adds collision coalescing.
 */

typedef struct ob {ulong refs; ulong hashflag;
                   struct ob *a; struct ob *b;} ob;
        /* just something all ob-cells have in common, ignoring
           COM niceties */

bool q(ob *x, ob *y); // forward declaration

bool qa(ob **px, ob **py)
  { if ( !q(a(*px), a(*py)) ) return false;
    px->a = py->a = preferable(*px, *py);
    return true;
    }

bool qb(ob **px, ob **py)
  { if ( !q(b(*px), b(*py)) ) return false;
    px->b = py->b = preferable(*px, *py);
    return true;
    }

bool q(ob *x, ob *y)
  {  if (x == y) return true;
     if (x->hashflag != y->hashflag) return false;
     if (x->a == x) return false;
     if (x->b == x) return qa(x, y);
     return qa(x, y) && qb(x, y);
    }

/*
 *  0.0.1 2026-02-19T19:13Z Clean-up
 *  0.0.0 2026-02-19T00:20Z Trial code - extending from m230900c1.c
 *
 *                *** end of m230900c2.c ***                      */
