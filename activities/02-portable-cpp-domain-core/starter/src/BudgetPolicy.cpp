#include "BudgetPolicy.hpp"
Decision BudgetPolicy::evaluate(Money limit, Money spent, Money draft) const {
    // TODO: enforce positive amounts and prevent overspend.
    return {true, Money{limit.cents - spent.cents - draft.cents}};
}
