#include "BudgetPolicy.hpp"
Decision BudgetPolicy::evaluate(Money limit, Money spent, Money draft) const {
    if (limit.cents < 0 || spent.cents < 0 || draft.cents <= 0) return {false, Money{limit.cents-spent.cents}};
    if (draft.cents > limit.cents-spent.cents) return {false, Money{limit.cents-spent.cents}};
    return {true, Money{limit.cents-spent.cents-draft.cents}};
}
