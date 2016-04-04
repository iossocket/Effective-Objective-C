###何时使用self.属性名访问&何时使用_变量名访问

下面列出两者的区别：

- 直接访问实例变量时，不经过OC的method dispatch，速度比较快。
- 直接访问时，绕开了属性定义的“内存管理语义”，赋值时将retain新值，release旧值；
- 直接访问时，将不会触发KVO
- 通过属性访问，有助于排错，可以在getter和setter方法中设置断点

因此常用的方式为：在设置新值时，通过属性。而在访问时，可直接通过实例变量进行。

但存在一个列外：

在EOCPerson和其子类EOCSmithPerson中，子类可能会因为需求而复写一个set方法

```Objective-C
- (void)setLastName:(NSString *)lastName {
    if (![lastName isEqualToString:@"Smith"]) {
        [NSException raise:NSInvalidArgumentException format:@"Last name must be Smith"];
    }
    self.lastName = lastName;
}
```
而父类有一个构造方法
```Objective-C
- (instancetype) init {
    if (self = [super init]) {
        self.firstName = @"";
        self.lastName = @"";
    }
    return self;
}
```

当子类通过该构造方法初始化一个对象时将会抛出异常

```Objective-C
EOCSmithPerson *smithPerson = [[EOCSmithPerson alloc] init];
```

这是由于，在调用父类的初始化方法时的`self.lastName = @""`时，将调用子类的`- (void)setLastName:(NSString *)lastName`方法，而抛出了一个异常。