// these are the various screen placement constants used across most the UIViewControllers

// padding for margins

// for general screen
#define kLeftMargin				20.0
#define kTopMargin				20.0
#define kRightMargin			20.0
#define kTweenMargin			10.0

#define kTextFieldHeight		30.0


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#define AppDBName @"ADTestLabsData.sqlite"
#define AppDBName_ADHospital @"ADHospital.sqlite"


#define ScaleLevelAD8_Title @"AD8记忆障碍自评量表"
#define ScaleLevelADL_Title @"日常生活能力量表"
#define ScaleLevelOLD_Title @"痴呆初期征兆的观察列表"
#define ScaleLevelHAMND_Title @"汉密尔顿抑郁量表"
#define ScaleLevelHIS_Title @"哈金斯基缺血量表"
#define ScaleLevelMMSE_Title @"MMSE量表"
#define ScaleLevelMOCA_Title @"蒙特利尔认知评估量表"

#define HospitalAnnotationIdentifier @"HospitalAnnotationIdentifier"

typedef enum {
	ScaleLevelAD8,
	ScaleLevelADL,
	ScaleLevelOLD,
	ScaleLevelHAMND,
    ScaleLevelHIS,
	ScaleLevelMMSE,
	ScaleLevelMOCA
    
} ScaleLevelTag;

