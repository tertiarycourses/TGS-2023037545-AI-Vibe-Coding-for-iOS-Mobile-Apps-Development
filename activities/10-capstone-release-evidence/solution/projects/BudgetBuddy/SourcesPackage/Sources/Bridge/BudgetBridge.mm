#import "BudgetBridge.h"
#include "BudgetPolicy.hpp"
#include <memory>
NSErrorDomain const BudgetDomain = @"BudgetDomain";
@implementation BudgetResultDTO
- (instancetype)initWithAccepted:(BOOL)accepted remainingCents:(int64_t)remainingCents { if ((self = [super init])) { _accepted = accepted; _remainingCents = remainingCents; } return self; }
@end
@interface BudgetBridge () { std::unique_ptr<BudgetPolicy> _policy; }
@end
@implementation BudgetBridge
- (instancetype)init { if ((self = [super init])) { _policy = std::make_unique<BudgetPolicy>(); } return self; }
- (int64_t)remainingForLimit:(int64_t)limit spent:(int64_t)spent draft:(int64_t)draft { return _policy->evaluate(limit, spent, draft).remaining; }
- (NSInteger)errorCodeForLimit:(int64_t)limit spent:(int64_t)spent draft:(int64_t)draft { const auto r = _policy->evaluate(limit, spent, draft); return r.accepted ? 0 : (draft <= 0 ? BudgetErrorInvalidInput : BudgetErrorOverBudget); }
- (BudgetResultDTO *)evaluateLimit:(int64_t)limit spent:(int64_t)spent draft:(int64_t)draft error:(NSError **)error {
    const auto result = _policy->evaluate(limit, spent, draft);
    if (!result.accepted && error) { const NSInteger code = draft <= 0 ? BudgetErrorInvalidInput : BudgetErrorOverBudget; *error = [NSError errorWithDomain:BudgetDomain code:code userInfo:@{NSLocalizedRecoverySuggestionErrorKey: @"Correct the amount and retry."}]; }
    return [[BudgetResultDTO alloc] initWithAccepted:result.accepted remainingCents:result.remaining];
}
@end
