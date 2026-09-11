#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface BudgetResultDTO : NSObject
@property(nonatomic, readonly) BOOL accepted;
@property(nonatomic, readonly) int64_t remainingCents;
@end
@interface BudgetBridge : NSObject
- (BudgetResultDTO * _Nullable)evaluateLimit:(int64_t)limit spent:(int64_t)spent draft:(int64_t)draft error:(NSError **)error;
@end
NS_ASSUME_NONNULL_END
