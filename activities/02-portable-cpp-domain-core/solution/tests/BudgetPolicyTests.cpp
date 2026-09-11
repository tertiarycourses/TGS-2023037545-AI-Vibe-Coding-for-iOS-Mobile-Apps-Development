#include "BudgetPolicy.hpp"
#include <cassert>
int main(){ BudgetPolicy p; assert(p.evaluate({10000},{2500},{1250}).remaining.cents==6250); assert(!p.evaluate({10000},{2500},{0}).accepted); assert(!p.evaluate({10000},{2500},{8000}).accepted); return 0; }
