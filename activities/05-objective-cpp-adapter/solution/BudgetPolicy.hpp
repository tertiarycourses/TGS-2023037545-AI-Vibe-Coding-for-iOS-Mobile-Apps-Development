#pragma once
#include <cstdint>
struct Money { std::int64_t cents; };
struct Decision { bool accepted; Money remaining; };
class BudgetPolicy { public: Decision evaluate(Money limit, Money spent, Money draft) const {
 if(limit.cents<0 || spent.cents<0 || draft.cents<=0) return {false,{limit.cents-spent.cents}};
 if(draft.cents>limit.cents-spent.cents) return {false,{limit.cents-spent.cents}};
 return {true,{limit.cents-spent.cents-draft.cents}}; } };
