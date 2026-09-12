#pragma once
#include <cstdint>
struct BudgetDecision { bool accepted; std::int64_t remaining; };
class BudgetPolicy { public: BudgetDecision evaluate(std::int64_t limit, std::int64_t spent, std::int64_t draft) const noexcept; };
