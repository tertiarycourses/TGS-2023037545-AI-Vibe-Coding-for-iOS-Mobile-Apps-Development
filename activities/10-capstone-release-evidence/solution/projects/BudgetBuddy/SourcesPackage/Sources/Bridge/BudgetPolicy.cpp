#include "BudgetPolicy.hpp"
BudgetDecision BudgetPolicy::evaluate(std::int64_t limit, std::int64_t spent, std::int64_t draft) const noexcept {
    if (limit < 0 || spent < 0 || spent > limit || draft <= 0) return {false, limit - spent};
    const auto remaining = limit - spent;
    if (draft > remaining) return {false, remaining};
    return {true, remaining - draft};
}
