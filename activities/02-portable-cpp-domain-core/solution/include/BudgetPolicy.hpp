#pragma once
#include <cstdint>
struct Money { std::int64_t cents; };
struct Decision { bool accepted; Money remaining; };
class BudgetPolicy { public: Decision evaluate(Money limit, Money spent, Money draft) const; };
