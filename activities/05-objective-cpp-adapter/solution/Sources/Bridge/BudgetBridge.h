#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
FOUNDATION_EXPORT NSErrorDomain const BudgetDomain;
typedef NS_ERROR_ENUM(BudgetDomain, BudgetErrorCode) { BudgetErrorInvalidInput = 1001, BudgetErrorOverBudget = 1002 };
@interface BudgetResultDTO : NSObject
@property(nonatomic, readonly) BOOL accepted;
@property(nonatomic, readonly) int64_t remainingCents;
- (instancetype)initWithAccepted:(BOOL)accepted remainingCents:(int64_t)remainingCents;
@end
@interface BudgetBridge : NSObject
- (int64_t)remainingForLimit:(int64_t)limit spent:(int64_t)spent draft:(int64_t)draft;
- (NSInteger)errorCodeForLimit:(int64_t)limit spent:(int64_t)spent draft:(int64_t)draft;
- (nullable BudgetResultDTO *)evaluateLimit:(int64_t)limit spent:(int64_t)spent draft:(int64_t)draft error:(NSError * _Nullable * _Nullable)error;
@end
NS_ASSUME_NONNULL_END
