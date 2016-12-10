//
//  UIImage+BB.h
//  weibo1
//
//  Created by 谢鹏飞 on 15/10/18.
//  Copyright © 2015年 roc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>

@interface UIImage (PF)
+ (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius usingImage:(UIImage *)original;
+(UIImage *)makeRoundedImage:(UIImage *) image radius: (float) radius;
+(UIImage *)resizeImageWithName:(NSString *)name;
+(UIImage *)resizeImageWithName:(NSString *)name left:(CGFloat) left top:(CGFloat)top;
+(UIImage*) imageWithColor:(UIColor*)color;
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
+(UIImage *) imageClipToNewImage:(UIImage *)image newSize:(CGSize)size;
+(UIImage *) imageWithClipImage:(UIImage * )image borderWidth:(CGFloat) borderWidth borderColor:(UIColor *) borderColor;
-(UIImage*)clipImageToOval;
+ (UIImage *) imageWithView:(UIView *)view;

+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;
+ (UIImage *)horizontalRotationImage:(UIImage *)image;

- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

+(UIImage *) imageWithSquareImage:(UIImage * )image borderWidth:(CGFloat) borderWidth borderColor:(UIColor *) borderColor cornerRadius:(CGFloat)cornerRadius;
+(UIImage *)getImageFromView:(UIView *)theView;
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
@end
