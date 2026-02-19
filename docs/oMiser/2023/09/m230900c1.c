/* m230900c1.c 0.0.0                UTF-8                         2026-02-18
 * -|----1----|----2----|----3----|----4----|----5----|----6----|----7----|--*
 *
 *                     IMPLEMENTATION OF OB COMPARISON
 *                     ===============================
 *
 *   This is a pseudo (semi-COM C/C++) determination that two ob-cells are
 *   representations of the same ob.
 */

typedef struct ob {ulong refs; ulong hashflag;
                   struct ob *a; struct ob *b;} ob;
        /* just something all ob-cells have in common, ignoring
           COM niceties */

bool q(ob *x, ob *y)
  {  if (x == y) return true;  // same address, same ob
     if (x->hashflag != y->hashflag) return false;
     if (x->a == x) return false;  // same individual only if same address
     if (x->b == x) return q(x->a, y->a); // check enclosure a-parts
     return q(x->a, y->a) && q(x->b, y->b); // must be two pairs
    }

/* Here, (x->a == x) is C/C++ for is-individual(x) and
 *       (x->b == x) is C/C++ for is-singleton(x)
 */

/*
 *  0.0.0 2026-02-18T21:17Z Trial code - not yet tested.
 *
 *                *** end of m230900c1.c ***                      */
