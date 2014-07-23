//
//  AuthViewController.m
//  SocNetworksApiResearch
//
//  Created by Mars on 7/23/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import "AuthViewController.h"
#import "StringBetween.h"

@interface AuthViewController ()

@end

@implementation AuthViewController

@synthesize authView, indicator, textError;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    authView.hidden = YES;
    textError.hidden = YES;
    
    NSString* client_id = @"4472085";
    NSString* scope = @"friends,wall,messages,audio";
   
    NSString *authString = [NSString stringWithFormat:@"https://api.vkontakte.ru/oauth/authorize?client_id=%@&scope=%@&redirect_uri=blank.html&response_type=token", client_id, scope];

    NSURL *authURL = [[NSURL alloc] initWithString:authString];
    NSURLRequest *authRequest = [[NSURLRequest alloc] initWithURL:authURL];
    [authView loadRequest:authRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if ([authView.request.URL.absoluteString rangeOfString:@"access_token"].location != NSNotFound) {
        authView.hidden = YES;
        textError.hidden = YES;
        NSString *secret = [authView.request.URL.absoluteString getStringBetweenString:@"access_token" andString:@"&"]; //извлекаем из ответа token
        NSLog(@"secret=%@", secret); //печатаем secret в консоль
    } else if ([authView.request.URL.absoluteString rangeOfString:@"error"].location != NSNotFound) {
        authView.hidden = YES;
        textError.hidden = NO;
        NSLog(@"error=%@", authView.request.URL.absoluteString); //выводим ошибку
    } else {
        textError.hidden = YES;
        authView.hidden = NO; //показываем окно авторизации
    }
    [indicator stopAnimating];
    indicator.hidden = YES;
}

@end
