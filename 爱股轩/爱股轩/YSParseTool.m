//
//  YSParseTool.m
//  优胜办公
//
//  Created by imac on 2017/2/22.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "YSParseTool.h"
//#import "YWarnModel.h"
//#import "YGoodClassModel.h"
//#import "YGoodsModel.h"
//#import "YAddressModel.h"
//#import "YSGoodTypeEditModel.h"

@implementation YSParseTool

//#pragma mark ==解析公告==
//+(NSMutableArray *)getParseAnnounce:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in data) {
//        YWarnModel *model = [[YWarnModel alloc]init];
//        model.warnTitle = dic[@"title"];
//        model.warnId = dic[@"id"];
//        [list addObject:model];
//    }
//    return list;
//}
//
//#pragma mark ==商品一级分类==
//+(NSMutableArray *)getParseGoodTypes:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in data) {
//        YGoodClassModel *model= [[YGoodClassModel alloc]init];
//        model.classTitle = dic[@"class_name"];
//        model.classdesc = dic[@"description"];
//        model.imageName = dic[@"pic_url"];
//        model.classID = dic[@"id"];
//        [list addObject:model];
//    }
//    return list;
//}
//#pragma mark ==猜你喜欢==
//+(NSMutableArray *)getParseGoodLoves:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in data) {
//        YGoodsModel *model = [[YGoodsModel alloc]init];
//        model.goodId = dic[@"id"];
//        model.goodTitle = dic[@"title"];
//        model.goodUrl = dic[@"pic_url"];
//        model.goodMoney =dic[@"price_market"];
//        [list addObject:model];
//    }
//    return list;
//
//}
//#pragma mark ==个人中心==
//+(YPersonViewModel *)getParsePersonView:(NSDictionary *)data{
//    YPersonViewModel *model = [[YPersonViewModel alloc]init];
//    model.headImage = data[@"header_img"];
//    model.nick_name = data[@"nick_name"];
//    model.balance   = data[@"balance"];
//    model.coupon    = data[@"my_coupon"];
//    model.integral  = data[@"integral"];
//    model.bill      = [NSString stringWithFormat:@"%@",data[@"fapiao"]];
//    model.leaveBill = [NSString stringWithFormat:@"%@",data[@"yudan"]];
//    return model;
//}
//#pragma mark ==个人中心商品列表==
//+(NSMutableArray *)getParseGoods:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in data) {
//        YGoodsModel *model = [[YGoodsModel alloc]init];
//        model.goodId = dic[@"id"];
//        model.goodTitle = dic[@"title"];
//        model.goodMoney = dic[@"price_member"];
//        model.goodUrl = dic[@"img"];
//        [list addObject:model];
//    }
//    return list;
//}
//#pragma mark ==收藏类别==
//+(NSMutableArray *)getParseGoodCollectClass:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YGoodClassModel *class = [[YGoodClassModel alloc]init];
//        class.classTitle = dic[@"class_name"];
//        class.classID = dic[@"class_id"];
//        [list addObject:class];
//    }
//    return list;
//}
//
//#pragma mark ==获取地址列表==
//+(NSMutableArray *)getParseAddress:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in data) {
//        YAddressModel *model = [[YAddressModel alloc]init];
//        model.addressId = dic[@"id"];
//        model.name = dic[@"realname"];
//        model.phone = dic[@"mobile"];
//        model.province = dic[@"prov"];
//        model.city = dic[@"city"];
//        NSString *str;
//        if (IsNull(dic[@"dist"])) {
//          str =@"";
//        }else{
//          str = dic[@"dist"];
//          if ([str isEqualToString:@"-1"]) {
//             str =@"";
//          }
//        }
//        model.area = str;
//        model.Address = dic[@"address"];
//        model.isDefault = [dic[@"status"] integerValue]==1?YES:NO;
//        model.addressId = dic[@"id"];
//        [list addObject:model];
//    }
//    return list;
//}
//
//#pragma mark ==我的评级==
//+(NSMutableArray *)getParsePersonParise:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YGoodAppraiseModel *model = [[YGoodAppraiseModel alloc]init];
//        model.time = dic[@"create_time"];
//        model.info = dic[@"content"];
//        NSMutableArray *img =[NSMutableArray array];
//        NSString *image = dic[@"img"];
//        NSArray *data =[image componentsSeparatedByString:@"$"];
//        if (data.count) {
//            for (NSString *str in data) {
//                [img addObject:str];
//            }
//            model.imageArr = img;
//        }
//        model.imageUrl = dic[@"mainImg"];
//        YGoodsModel *good= [[YGoodsModel alloc]init];
//        good.goodTitle = dic[@"title"];
//        model.model = good;
//        NSMutableArray *types = [NSMutableArray array];
//        for (NSDictionary *ds in dic[@"attra"]) {
//            YGoodTypeModel *tp = [[YGoodTypeModel alloc]init];
//            tp.name = ds[@"name"];
//            tp.size = ds[@"item"];
//            [types addObject:tp];
//        }
//        model.list = types;
//        [list addObject:model];
//    }
//    return list;
//}
//
//#pragma mark ==一级分类==
//+(NSMutableArray *)getParseClassOne:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YCLassModel *model = [[YCLassModel alloc]init];
//        model.classId = dic[@"id"];
//        model.className = dic[@"class_name"];
//        [list addObject:model];
//    }
//    return list;
//}
//#pragma mark ==次级分类==
//+(NSMutableArray *)getParseClassTwo:(NSArray *)data{
//    NSMutableArray *lists = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YClassTwoModel *model = [[YClassTwoModel alloc]init];
//        model.classId = dic[@"id"];
//        model.sectionName = dic[@"class_name"];
//        NSArray *array = dic[@"child"];
//        NSMutableArray *list = [NSMutableArray array];
//        for (NSDictionary*dic in array) {
//            YClassThreeModel *class = [[YClassThreeModel alloc]init];
//            class.imageName = dic[@"pic_url"];
//            class.classId = dic[@"id"];
//            class.title = dic[@"class_name"];
//            [list addObject:class];
//        }
//        model.array = list;
//        [lists addObject:model];
//    }
//  return lists;
//}
//
//#pragma mark ==商品详情==
//+(YGoodDetailModel *)getParseGoodDetail:(NSDictionary *)data{
//    YGoodDetailModel *model = [[YGoodDetailModel alloc]init];
//    model.goodId = data[@"id"];
//    model.goodTitle = data[@"title"];
//    model.goodMoney = data[@"price_member"];
//    model.stock = data[@"minStock"];
//    model.picUrl = data[@"goods_detail"];
//    model.imageArr =data[@"goods_img"];
//    model.isCollected = data[@"is_collect"];
//    if (model.imageArr.count) {
//        model.goodUrl = model.imageArr[0];
//    }
//    NSMutableArray *house = [NSMutableArray array];
//    NSArray *locations = data[@"warehouse"];
//    for (NSDictionary*dic in locations) {
//        YSGoodLocationModel *local = [[YSGoodLocationModel alloc]init];
//        local.name = dic[@"name"];
//        local.locationId = dic[@"id"];
//        [house addObject:local];
//    }
//    model.location = house;
//    NSMutableArray *types = [NSMutableArray array];
//    for (NSDictionary *dic in data[@"allattrcha"]) {
//        YGoodSizeModel *size = [[YGoodSizeModel alloc]init];
//        size.typeName = dic[@"name"];
//        NSMutableArray *choose = [NSMutableArray array];
//        for (NSDictionary *che in dic[@"value"]) {
//            YSSizeModel *check = [[YSSizeModel alloc]init];
//            check.name = che[@"attr"];
//            check.sizeId = che[@"spci"];
//            [choose addObject:check];
//        }
//        size.size =choose;
//        [types addObject:size];
//    }
//    model.goodSize = types;
//    return model;
//}
//
//#pragma mark ==商品详情评论==
//+(NSMutableArray *)getParseGoodAppraise:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in data) {
//        YGoodAppraiseModel *model = [[YGoodAppraiseModel alloc]init];
//        model.name = dic[@"nick_name"];
//        if (IsNilString(model.name)) {
//            model.name = dic[@"user_name"];
//        }
//        model.time = dic[@"create_time"];
//        model.grade = dic[@"status"];
//        model.info = dic[@"content"];
//        NSString *image = dic[@"img"];
//        NSArray *arr = [image componentsSeparatedByString:@"$"];
//        model.imageArr = [NSMutableArray arrayWithArray:arr];
//        NSMutableArray *types = [NSMutableArray array];
//        for (NSDictionary *ds in dic[@"attr"]) {
//            YGoodTypeModel *tp = [[YGoodTypeModel alloc]init];
//            tp.name = ds[@"name"];
//            tp.size = ds[@"item"];
//            [types addObject:tp];
//        }
//        model.list = types;
//        [list addObject:model];
//    }
//    return list;
//}
//
//#pragma mark ==商品列表==
//+(NSMutableArray *)getParseFilterGood:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YGoodsModel *model = [[YGoodsModel alloc]init];
//        model.goodId = dic[@"id"];
//        model.goodTitle = dic[@"title"];
//        model.goodMoney = dic[@"price_member"];
//        model.goodUrl = dic[@"pic_url"];
//        model.goodeValuateCount = dic[@"comment_count"];
//        [list addObject:model];
//    }
//    return list;
//}
//
//+(NSMutableArray *)getParseFilterGoodSearch:(NSArray*)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YGoodsModel *model = [[YGoodsModel alloc]init];
//        model.goodId = dic[@"id"];
//        model.goodTitle = dic[@"title"];
//        model.goodMoney = dic[@"price_member"];
//        model.goodUrl = dic[@"img"];
//        model.goodeValuateCount = dic[@"count"];
//        [list addObject:model];
//    }
//    return list;
//}
//
//#pragma mark ==购物车商品==
//+(NSMutableArray *)getParseShopCart:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in data) {
//        YShopGoodModel *model = [[YShopGoodModel alloc]init];
//        model.goodTitle = dic[@"title"];
//        model.goodUrl = dic[@"pic_url"];
//        model.shopCartId = dic[@"id"];
//        model.goodId = dic[@"goods_id"];
//        model.goodCount = dic[@"goods_num"];
//        model.goodMoney = dic[@"price_member"];
//        NSArray *types = dic[@"item"];
//        NSMutableArray *arr = [NSMutableArray array];
//        for (NSDictionary *ak in types) {
//            YGoodTypeModel *type = [[YGoodTypeModel alloc]init];
//            type.name = ak[@"spec"];
//            type.size = ak[@"item"];
//            [arr addObject:type];
//        }
//        model.goodTypeArr = arr;
//        [list addObject:model];
//    }
//    return list;
//}
//#pragma mark ==规格选择器==
//+(NSMutableArray *)getParseGoodCheck:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YGoodSizeModel *model = [[YGoodSizeModel alloc]init];
//        model.typeName = dic[@"name"];
//        NSMutableArray *type = [NSMutableArray array];
//        for (NSDictionary*size in dic[@"children"]) {
//            YSSizeModel *gd = [[YSSizeModel alloc]init];
//            gd.name = size[@"item"];
//            gd.sizeId = size[@"id"];
//            [type addObject:gd];
//        }
//        model.size = type;
//        [list addObject:model];
//    }
//    return list;
//}
//#pragma mark ==各类商品规格==
//+(NSMutableArray *)getParseChooseGood:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YSGoodTypeEditModel *model = [[YSGoodTypeEditModel alloc]init];
//        model.goodsId = dic[@"id"];
//        model.goodMoney = dic[@"price_member"];
//        model.stock = dic[@"stock"];
//        model.key = dic[@"key"];
//        [list addObject:model];
//    }
//    return list;
//}
//#pragma mark ==我的采购需求单==
//+(NSMutableArray *)getParseMyPurchase:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YBuyingLeadsModel *model = [[YBuyingLeadsModel alloc]init];
//        model.purchaseId = dic[@"purchase_id"];
//        model.title = dic[@"purchase_title"];
//        model.creatTime = dic[@"create_time"];
//        model.status = dic[@"state"];
//        [list addObject:model];
//    }
//    return list;
//}
//
//#pragma mark ==采购需求单==
//+(YBuyingLeadsModel *)getParsePurchas:(NSDictionary *)data{
//    YBuyingLeadsModel *model = [[YBuyingLeadsModel alloc]init];
//    model.purchaseId = data[@"purchase_id"];
//    model.title = data[@"purchase_title"];
//    model.type = data[@"purchase_type"];
//    model.total = data[@"total_price"];
//    model.cusName = data[@"contacts"];
//    model.phone = data[@"tel"];
//    model.date = data[@"overtime"];
//    model.payType = data[@"pay_type"];
//    model.billType = data[@"invoice"];
//    model.info = data[@"explain"];
//    NSArray *goods = data[@"son"];
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in goods) {
//        YBuyingGoodModel *god =[self getParseEditerPurchase:dic];
//        [list addObject:god];
//    }
//    model.goodArr = list;
//    return model;
//}
//#pragma mark ==采购商品列表==
//+(NSMutableArray *)getParsePurchase:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary *dic in data) {
//        YBuyingGoodModel *model = [[YBuyingGoodModel alloc]init];
//        model.goodID = dic[@"purchase_product_id"];
//        model.goodName = dic[@"productname"];
//        model.goodMoney = dic[@"productbudget"];
//        model.goodCount = dic[@"productnum"];
//        [list addObject:model];
//    }
//    return list;
//}
//
//#pragma mark ==编辑采购商品==
//+(YBuyingGoodModel *)getParseEditerPurchase:(NSDictionary *)data{
//    YBuyingGoodModel *model = [[YBuyingGoodModel alloc]init];
//    model.goodID = data[@"purchase_product_id"];
//    model.goodNo = data[@"product_sn"];
//    model.goodMoney = data[@"productbudget"];
//    model.goodName = data[@"productname"];
//    model.goodClass = data[@"productclass"];
//    model.goodCount = data[@"productnum"];
//    model.goodInfo = data[@"productexplain"];
//    NSString *image = data[@"productimg"];
//    if ([image containsString:@"$"]) {
//        NSArray *arr = [image componentsSeparatedByString:@"$"];
//        model.imageArr = [NSMutableArray arrayWithArray:arr];
//    }else{
//        if (!IsNilString(image)) {
//            NSArray *arr = @[image];
//             model.imageArr = [NSMutableArray arrayWithArray:arr];
//        }
//    }
//
//    return model;
//}
//
//#pragma mark ==采购商品筛选==
//+(NSMutableArray *)getParseGoodsChoose:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YBuyingGoodModel *model = [[YBuyingGoodModel alloc]init];
//        model.goodNo = dic[@"code"];
//        model.goodName = dic[@"title"];
//        model.goodClass = dic[@"class_name"];
//        [list addObject:model];
//    }
//    return list;
//}
//
//#pragma mark ==举报中心筛选==
//+(NSMutableArray *)getParseReportsDetail:(NSArray *)data{
//    NSMutableArray *list = [NSMutableArray array];
//    for (NSDictionary*dic in data) {
//        YReportModel *model = [[YReportModel alloc]init];
//        model.title = dic[@"reason"];
//        model.date = dic[@"create_time"];
//        model.reason = dic[@"content"];
//        [list addObject:model];
//    }
//    return list;
//}


@end
