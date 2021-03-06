/**
 * Beijing Sankuai Online Technology Co.,Ltd (Meituan)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

#import "EZMHandler+ProjectPrivate.h"

typedef void (^EZMApplyBlock)(void);

@implementation EZMHandler {
    EZMApplyBlock _block;
}

- (instancetype)initWithBlock:(EZMApplyBlock)block {
    if (self = [super init]) {
        _block = block;
    }
    return self;
}

- (void)next:(id)value from:(EZRSenderList *)senderList context:(id)context {
    [self execute];
    [super next:value from:senderList context:context];
}

- (void)execute {
    if (_block) {
        _block();
    }
}

+ (instancetype)actionWithBlock:(EZMApplyBlock)block {
    return [[self alloc] initWithBlock:block];
}

@end
