#import "BudgetBridge.h"
#include <memory>
#include "BudgetPolicy.hpp"
@interface BudgetResultDTO ()
@property(nonatomic, readwrite) BOOL accepted;
@property(nonatomic, readwrite) int64_t remainingCents;
@end
@implementation BudgetResultDTO @end
@interface BudgetBridge () { std::unique_ptr<BudgetPolicy> _policy; }
@end
@implementation BudgetBridge
- (instancetype)init { if((self=[super init])) _policy=std::make_unique<BudgetPolicy>(); return self; }
- (BudgetResultDTO *)evaluateLimit:(int64_t)l spent:(int64_t)s draft:(int64_t)d error:(NSError **)error {
 auto r=_policy->evaluate({l},{s},{d}); if(!r.accepted && error) *error=[NSError errorWithDomain:@"BudgetDomain" code:1001 userInfo:nil];
 BudgetResultDTO *dto=[BudgetResultDTO new]; dto.accepted=r.accepted; dto.remainingCents=r.remaining.cents; return dto; }
@end
