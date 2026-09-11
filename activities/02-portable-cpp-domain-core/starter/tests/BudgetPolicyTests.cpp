#include "BudgetPolicy.hpp"
#include <cassert>
int main(){ BudgetPolicy p; auto ok=p.evaluate({10000},{2500},{1250}); assert(ok.accepted); assert(ok.remaining.cents==6250); return 0; }
