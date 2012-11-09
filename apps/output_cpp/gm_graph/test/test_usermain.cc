#include <stdio.h>
#include "gm.h"

int test_procedure(gm_graph& G, int a, float* np, float* ep)
{
#pragma omp parallel for
    for(node_t i = 0; i < G.num_nodes(); i++) {
        np[i] = np[i] * a;
    }

#pragma omp parallel for
    for(edge_t i = 0; i < G.num_edges(); i++) {
        ep[i] = ep[i] + a;
    }

    return 1;
}

int main(int argc, char** argv)
{
    gm_default_usermain Main;

    Main.declare_property("np", GMTYPE_FLOAT, true, true, GM_NODEPROP);
    Main.declare_property("ep", GMTYPE_FLOAT, true, true, GM_EDGEPROP);
    Main.declare_scalar("a", GMTYPE_INT, true, false);
    Main.declare_return(GMTYPE_INT);

    if (!Main.process_arguments(argc, argv))
        return EXIT_FAILURE;


}
