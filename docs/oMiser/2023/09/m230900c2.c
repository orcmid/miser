/* m230900c2.c 0.0.0                UTF-8                         2026-02-19
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
    px->a = py->a = oldest(*px, *py);
    return true;
    }

bool qb(ob **px, ob **py)
  { if ( !q(b(*px), b(*py)) ) return false;
    px->b = py->b = oldest(*px, *py);
    return true;
    }

bool q(ob *x, ob *y)
  {  if (x == y) return true;  // same address, same ob
     if (x->hashflag != y->hashflag) return false;
     if (x->a == x) return false;  // same individual only if same address
     if (x->b == x) return qa(x, y); // check enclosure a-parts
     return qa(x, y) && qb(x, y); // must be two pairs
    }

/* Here, (x->a == x) is C/C++ for is-individual(x) and
 *       (x->b == x) is C/C++ for is-singleton(x)
 */

/*
 *  0.0.0 2026-02-19T00:20Z Trial code - extending from m230900c1.c
 *
 *                *** end of m230900c2.c ***                      */
