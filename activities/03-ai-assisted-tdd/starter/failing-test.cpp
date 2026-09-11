#include "BudgetPolicy.hpp"
#include <cassert>
int main(){ BudgetPolicy p; auto d=p.evaluate({10000},{9000},{2000}); assert(!d.accepted); }
