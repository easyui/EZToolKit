//
//  EZSerializeMacroTest.m
//  EZToolKit
//
//  Created by neu on 16/5/25.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"
#import <objc/runtime.h>
#import "EZSerializeMacro.h"
@interface EZSerializeMacroTest : XCTestCase

@end

@implementation EZSerializeMacroTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Person *person = [[Person alloc] init];
    person.name = @"wengzilin";
    person.age = 26;
    [person setValue:@"laoweng" forKey:@"_father"];
    //set value of superClass
    person.introInBiology = @"I am a biology on earth";
    //   [person setValue:@(10000) forKey:@"_hairCountInBiology"];//no access to private instance in super
    
    
    NSLog(@"Before archiver:\n%@", [person description]);
    
    EZSERIALIZE_ARCHIVE(person, @"Person", [self filePath]);
    Person *thePerson = nil;
    EZSERIALIZE_UNARCHIVE(thePerson, @"Person", [self filePath]);
    
    Person *copyPerson = [person copy];
    NSLog(@"copyPerson:%@", [copyPerson description]);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


- (NSString *)filePath
{
    NSString *archiverFilePath = [NSString stringWithFormat:@"%@/archiver", NSHomeDirectory()];
    return archiverFilePath;
}
@end
