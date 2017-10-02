//
//  ViewController.m
//  Citi Tour
//
//  Created by FSP NYP on 28/9/17.
//  Copyright © 2017 FSP NYP. All rights reserved.
//

#import "ViewController.h"
#import <DoubleControlSDK/DoubleControlSDK.h>
@import AVFoundation;

static NSString * BCP47LanguageCodeFromISO681LanguageCode(NSString *ISO681LanguageCode) {
    if ([ISO681LanguageCode isEqualToString:@"ar"]) {
        return @"ar-SA";
    } else if ([ISO681LanguageCode hasPrefix:@"cs"]) {
        return @"cs-CZ";
    } else if ([ISO681LanguageCode hasPrefix:@"da"]) {
        return @"da-DK";
    } else if ([ISO681LanguageCode hasPrefix:@"de"]) {
        return @"de-DE";
    } else if ([ISO681LanguageCode hasPrefix:@"el"]) {
        return @"el-GR";
    } else if ([ISO681LanguageCode hasPrefix:@"en"]) {
        return @"en-US"; // en-AU, en-GB, en-IE, en-ZA
    } else if ([ISO681LanguageCode hasPrefix:@"es"]) {
        return @"es-ES"; // es-MX
    } else if ([ISO681LanguageCode hasPrefix:@"fi"]) {
        return @"fi-FI";
    } else if ([ISO681LanguageCode hasPrefix:@"fr"]) {
        return @"fr-FR"; // fr-CA
    } else if ([ISO681LanguageCode hasPrefix:@"hi"]) {
        return @"hi-IN";
    } else if ([ISO681LanguageCode hasPrefix:@"hu"]) {
        return @"hu-HU";
    } else if ([ISO681LanguageCode hasPrefix:@"id"]) {
        return @"id-ID";
    } else if ([ISO681LanguageCode hasPrefix:@"it"]) {
        return @"it-IT";
    } else if ([ISO681LanguageCode hasPrefix:@"ja"]) {
        return @"ja-JP";
    } else if ([ISO681LanguageCode hasPrefix:@"ko"]) {
        return @"ko-KR";
    } else if ([ISO681LanguageCode hasPrefix:@"nl"]) {
        return @"nl-NL"; // nl-BE
    } else if ([ISO681LanguageCode hasPrefix:@"no"]) {
        return @"no-NO";
    } else if ([ISO681LanguageCode hasPrefix:@"pl"]) {
        return @"pl-PL";
    } else if ([ISO681LanguageCode hasPrefix:@"pt"]) {
        return @"pt-BR"; // pt-PT
    } else if ([ISO681LanguageCode hasPrefix:@"ro"]) {
        return @"ro-RO";
    } else if ([ISO681LanguageCode hasPrefix:@"ru"]) {
        return @"ru-RU";
    } else if ([ISO681LanguageCode hasPrefix:@"sk"]) {
        return @"sk-SK";
    } else if ([ISO681LanguageCode hasPrefix:@"sv"]) {
        return @"sv-SE";
    } else if ([ISO681LanguageCode hasPrefix:@"th"]) {
        return @"th-TH";
    } else if ([ISO681LanguageCode hasPrefix:@"tr"]) {
        return @"tr-TR";
    } else if ([ISO681LanguageCode hasPrefix:@"zh"]) {
        return @"zh-CN"; // zh-HK, zh-TW
    } else {
        return nil;
    }
}

typedef NS_ENUM(NSInteger, SpeechUtteranceLanguage) {
    WelcomeMessage,
    FirstExhibit,
    
};

NSString * const SpeechUtterancesByExhibit[] = {
    
    [WelcomeMessage]     = @"Hello Everyone and Welcome to Citi Tour @ N Y P ,School Of Information Technology . We are Glad to have you with us today",
    [FirstExhibit]       = @"This is the First Exhibit",
};

static NSString * BCP47LanguageCodeForString(NSString *string) {
    NSString *ISO681LanguageCode = (__bridge NSString *)CFStringTokenizerCopyBestStringLanguage((__bridge CFStringRef)string, CFRangeMake(0, [string length]));
    return BCP47LanguageCodeFromISO681LanguageCode(ISO681LanguageCode);
}

UIImageView *TourImage;

@interface ViewController () <AVSpeechSynthesizerDelegate,DRDoubleDelegate>
@property (readwrite, nonatomic, copy) NSString *utteranceString;
@property (readwrite, nonatomic, strong) AVSpeechSynthesizer *speechSynthesizer;

@end

@implementation ViewController

@synthesize Image;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    self.speechSynthesizer.delegate = self;

    //movement
    [DRDouble sharedDouble].delegate = self;
    NSLog(@"SDL Version: %@", kDoubleBasicSDKVersion);
    
}

- (IBAction)Welcome:(id)sender {
    //Set Image
    
    [Image setImage:[UIImage imageNamed:@"centre-for-it-innovation-logo.jpg"]];
    
    
    //read Text
    self.utteranceString = SpeechUtterancesByExhibit[WelcomeMessage];
    self.Readtext.attributedText = [[NSAttributedString alloc] initWithString:self.utteranceString];
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.utteranceString];
    NSLog(@"BCP-47 Language Code: %@", BCP47LanguageCodeForString(utterance.speechString));
    
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:BCP47LanguageCodeForString(utterance.speechString)];
    //utterance.pitchMultiplier = 0.5f;
    //utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
    utterance.rate = 0.4f;
    utterance.preUtteranceDelay = 0.2f;
    utterance.postUtteranceDelay = 0.2f;
    
    [self.speechSynthesizer speakUtterance:utterance];
}


- (IBAction)First:(id)sender {
    //Set Image
    
     [Image setImage:[UIImage imageNamed:@"double-2-telepresence-robot_1.jpg"]];
    
    //read Text
    self.utteranceString = SpeechUtterancesByExhibit[FirstExhibit];
    self.Readtext.attributedText = [[NSAttributedString alloc] initWithString:self.utteranceString];
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.utteranceString];
    NSLog(@"BCP-47 Language Code: %@", BCP47LanguageCodeForString(utterance.speechString));
    
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:BCP47LanguageCodeForString(utterance.speechString)];
    //utterance.pitchMultiplier = 0.5f;
    //utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
    utterance.rate = 0.4f;
    utterance.preUtteranceDelay = 0.2f;
    utterance.postUtteranceDelay = 0.2f;
    
    [self.speechSynthesizer speakUtterance:utterance];
    
}

#pragma mark - AVSpeechSynthesizerDelegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
willSpeakRangeOfSpeechString:(NSRange)characterRange
                utterance:(AVSpeechUtterance *)utterance
{
    NSLog(@"%@ %@", [self class], NSStringFromSelector(_cmd));
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:self.utteranceString];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:characterRange];
    self.Readtext.attributedText = mutableAttributedString;
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
  didStartSpeechUtterance:(AVSpeechUtterance *)utterance
{
    NSLog(@"%@ %@", [self class], NSStringFromSelector(_cmd));
    
    self.Readtext.attributedText = [[NSAttributedString alloc] initWithString:self.utteranceString];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
 didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    NSLog(@"%@ %@", [self class], NSStringFromSelector(_cmd));
    
    self.Readtext.attributedText = [[NSAttributedString alloc] initWithString:self.utteranceString];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
