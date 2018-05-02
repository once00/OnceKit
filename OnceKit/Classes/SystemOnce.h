//
//  SystemOnce.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#ifndef SystemOnce_h
#define SystemOnce_h


#include <CoreGraphics/CGBase.h>
#include <CoreFoundation/CFDictionary.h>
#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFAvailability.h>
#include <stdint.h>

#define SCALE [[UIScreen mainScreen] bounds].size.width/375

CF_IMPLICIT_BRIDGING_ENABLED

CF_ASSUME_NONNULL_BEGIN

/* Points. */

struct TCGPoint {
    CGFloat x;
    CGFloat y;
};
typedef struct TCGPoint TCGPoint;

/* Sizes. */

struct TCGSize {
    CGFloat width;
    CGFloat height;
};
typedef struct TCGSize TCGSize;

/* Vectors. */

#define TCGVector_DEFINED 1

struct TCGVector {
    CGFloat dx;
    CGFloat dy;
};
typedef struct TCGVector TCGVector;

/* Rectangles. */

struct TCGRect {
    TCGPoint origin;
    TCGSize size;
};
typedef struct CGRect TCGRect;

/* Rectangle edges. */

typedef CF_ENUM(uint32_t, TCGRectEdge) {
    TCGRectMinXEdge, TCGRectMinYEdge, TCGRectMaxXEdge, TCGRectMaxYEdge
};

/* The "zero" point -- equivalent to TCGPointMake(0, 0). */

CG_EXTERN const TCGPoint TCGPointZero
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* The "zero" size -- equivalent to TCGSizeMake(0, 0). */

CG_EXTERN const TCGSize TCGSizeZero
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* The "zero" rectangle -- equivalent to TCGRectMake(0, 0, 0, 0). */

CG_EXTERN const TCGRect TCGRectZero
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* The "empty" rect. This is the rectangle returned when, for example, we
 intersect two disjoint rectangles. Note that the null rect is not the
 same as the zero rect. */

CG_EXTERN const TCGRect TCGRectNull
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* The infinite rectangle. */

CG_EXTERN const TCGRect TCGRectInfinite
CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Make a point from `(x, y)'. */

CG_INLINE TCGPoint TCGPointMake(CGFloat x, CGFloat y);

/* Make a size from `(width, height)'. */

CG_INLINE TCGSize TCGSizeMake(CGFloat width, CGFloat height);

/* Make a vector from `(dx, dy)'. */

CG_INLINE TCGVector TCGVectorMake(CGFloat dx, CGFloat dy);

/* Make a rect from `(x, y; width, height)'. */

CG_INLINE TCGRect TCGRectMake(CGFloat x, CGFloat y, CGFloat width,
                               CGFloat height);

/* Return the leftmost x-value of `rect'. */

CG_EXTERN CGFloat TCGRectGetMinX(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the midpoint x-value of `rect'. */

CG_EXTERN CGFloat TCGRectGetMidX(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the rightmost x-value of `rect'. */

CG_EXTERN CGFloat TCGRectGetMaxX(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the bottommost y-value of `rect'. */

CG_EXTERN CGFloat TCGRectGetMinY(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the midpoint y-value of `rect'. */

CG_EXTERN CGFloat TCGRectGetMidY(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the topmost y-value of `rect'. */

CG_EXTERN CGFloat TCGRectGetMaxY(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the width of `rect'. */

CG_EXTERN CGFloat TCGRectGetWidth(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the height of `rect'. */

CG_EXTERN CGFloat TCGRectGetHeight(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `point1' and `point2' are the same, false otherwise. */

CG_EXTERN bool TCGPointEqualToPoint(TCGPoint point1, TCGPoint point2)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `size1' and `size2' are the same, false otherwise. */

CG_EXTERN bool TCGSizeEqualToSize(TCGSize size1, TCGSize size2)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `rect1' and `rect2' are the same, false otherwise. */

CG_EXTERN bool TCGRectEqualToRect(TCGRect rect1, TCGRect rect2)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Standardize `rect' -- i.e., convert it to an equivalent rect which has
 positive width and height. */

CG_EXTERN TCGRect TCGRectStandardize(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `rect' is empty (that is, if it has zero width or height),
 false otherwise. A null rect is defined to be empty. */

CG_EXTERN bool TCGRectIsEmpty(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `rect' is the null rectangle, false otherwise. */

CG_EXTERN bool TCGRectIsNull(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `rect' is the infinite rectangle, false otherwise. */

CG_EXTERN bool TCGRectIsInfinite(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Inset `rect' by `(dx, dy)' -- i.e., offset its origin by `(dx, dy)', and
 decrease its size by `(2*dx, 2*dy)'. */

CG_EXTERN TCGRect TCGRectInset(TCGRect rect, CGFloat dx, CGFloat dy)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Expand `rect' to the smallest rect containing it with integral origin and
 size. */

CG_EXTERN TCGRect TCGRectIntegral(TCGRect rect)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the union of `r1' and `r2'. */

CG_EXTERN TCGRect TCGRectUnion(TCGRect r1, TCGRect r2)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the intersection of `r1' and `r2'. This may return a null rect. */

CG_EXTERN TCGRect TCGRectIntersection(TCGRect r1, TCGRect r2)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Offset `rect' by `(dx, dy)'. */

CG_EXTERN TCGRect TCGRectOffset(TCGRect rect, CGFloat dx, CGFloat dy)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Make two new rectangles, `slice' and `remainder', by dividing `rect' with
 a line that's parallel to one of its sides, specified by `edge' -- either
 `TCGRectMinXEdge', `TCGRectMinYEdge', `TCGRectMaxXEdge', or
 `TCGRectMaxYEdge'. The size of `slice' is determined by `amount', which
 measures the distance from the specified edge. */

CG_EXTERN void TCGRectDivide(TCGRect rect, TCGRect *  slice,
                             TCGRect *  remainder, CGFloat amount, TCGRectEdge edge)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `point' is contained in `rect', false otherwise. */

CG_EXTERN bool TCGRectContainsPoint(TCGRect rect, TCGPoint point)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `rect2' is contained in `rect1', false otherwise. `rect2'
 is contained in `rect1' if the union of `rect1' and `rect2' is equal to
 `rect1'. */

CG_EXTERN bool TCGRectContainsRect(TCGRect rect1, TCGRect rect2)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return true if `rect1' intersects `rect2', false otherwise. `rect1'
 intersects `rect2' if the intersection of `rect1' and `rect2' is not the
 null rect. */

CG_EXTERN bool TCGRectIntersectsRect(TCGRect rect1, TCGRect rect2)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/*** Persistent representations. ***/

/* Return a dictionary representation of `point'. */

CG_EXTERN CFDictionaryRef  TCGPointCreateDictionaryRepresentation(
                                                                  TCGPoint point)
CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Make a TCGPoint from the contents of `dict' (presumably returned earlier
 from `TCGPointCreateDictionaryRepresentation') and store the value in
 `point'. Returns true on success; false otherwise. */

CG_EXTERN bool TCGPointMakeWithDictionaryRepresentation(
                                                        CFDictionaryRef cg_nullable dict, TCGPoint * cg_nullable point)
CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Return a dictionary representation of `size'. */

CG_EXTERN CFDictionaryRef  TCGSizeCreateDictionaryRepresentation(TCGSize size)
CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Make a TCGSize from the contents of `dict' (presumably returned earlier
 from `TCGSizeCreateDictionaryRepresentation') and store the value in
 `size'. Returns true on success; false otherwise. */

CG_EXTERN bool TCGSizeMakeWithDictionaryRepresentation(
                                                       CFDictionaryRef cg_nullable dict, TCGSize * cg_nullable size)
CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Return a dictionary representation of `rect'. */

CG_EXTERN CFDictionaryRef  TCGRectCreateDictionaryRepresentation(TCGRect)
CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Make a TCGRect from the contents of `dict' (presumably returned earlier
 from `TCGRectCreateDictionaryRepresentation') and store the value in
 `rect'. Returns true on success; false otherwise. */

CG_EXTERN bool TCGRectMakeWithDictionaryRepresentation(
                                                       CFDictionaryRef cg_nullable dict, TCGRect * cg_nullable rect)
CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/*** Definitions of inline functions. ***/

CG_INLINE TCGPoint
TCGPointMake(CGFloat x, CGFloat y)
{
    TCGPoint p; p.x = x; p.y = y; return p;
}

CG_INLINE TCGSize
TCGSizeMake(CGFloat width, CGFloat height)
{
    TCGSize size; size.width = width; size.height = height; return size;
}

CG_INLINE TCGVector
TCGVectorMake(CGFloat dx, CGFloat dy)
{
    TCGVector vector; vector.dx = dx; vector.dy = dy; return vector;
}

CG_INLINE TCGRect
TCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    //    TCGRect rect;
    CGRect rect;
    rect.origin.x = x*SCALE; rect.origin.y = y*SCALE;
    rect.size.width = width*SCALE; rect.size.height = height*SCALE;
    rect=(CGRect)rect;
    return rect;
}

CG_INLINE bool
__TCGPointEqualToPoint(TCGPoint point1, TCGPoint point2)
{
    return point1.x == point2.x && point1.y == point2.y;
}
#define TCGPointEqualToPoint __TCGPointEqualToPoint

CG_INLINE bool
__TCGSizeEqualToSize(TCGSize size1, TCGSize size2)
{
    return size1.width == size2.width && size1.height == size2.height;
}

#define TCGSizeEqualToSize __TCGSizeEqualToSize

CF_ASSUME_NONNULL_END

CF_IMPLICIT_BRIDGING_DISABLED




#endif /* SystemOnce_h */
