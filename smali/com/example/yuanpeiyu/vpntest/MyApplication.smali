.class public Lcom/example/yuanpeiyu/vpntest/MyApplication;
.super Landroid/app/Application;
.source "ApplicationTemplate.java"


# static fields
.field public static FirstApplication:Ljava/lang/String;

.field public static realApplication:Landroid/app/Application;


# instance fields
.field private cl:Ldalvik/system/DexClassLoader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    .line 14
    const-string v0, "com.example.yuanpeiyu.vpntest.MyApplication"

    sput-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->FirstApplication:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method private getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 17
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 19
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v4

    if-nez v4, :cond_0

    .line 20
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 22
    :cond_0
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 26
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :goto_1
    return-object v1

    .line 17
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 26
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 111
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 113
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 114
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {v0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 117
    :cond_0
    return-void
.end method

.method public onCreate()V
    .locals 8

    .prologue
    .line 47
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 49
    invoke-static {}, Lcom/secneo/guard/Util;->getCustomClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    if-nez v5, :cond_0

    .line 50
    invoke-static {p0}, Lcom/secneo/guard/Util;->runAll(Landroid/content/Context;)V

    .line 53
    :cond_0
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->FirstApplication:Ljava/lang/String;

    .line 56
    .local v0, "applicationClass":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Lcom/secneo/guard/Util;->getCustomClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    check-cast v5, Ldalvik/system/DexClassLoader;

    iput-object v5, p0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->cl:Ldalvik/system/DexClassLoader;

    .line 57
    iget-object v5, p0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->cl:Ldalvik/system/DexClassLoader;

    invoke-virtual {v5, v0}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 58
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/Application;

    sput-object v5, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    sget-object v5, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    if-eqz v5, :cond_2

    .line 67
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v4

    .line 69
    .local v4, "p":Lcom/secneo/guard/ACall;
    sget-object v5, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    iget-object v6, p0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->cl:Ldalvik/system/DexClassLoader;

    invoke-virtual {p0}, Lcom/example/yuanpeiyu/vpntest/MyApplication;->getBaseContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v4, p0, v5, v6, v7}, Lcom/secneo/guard/ACall;->set2(Landroid/app/Application;Landroid/app/Application;Ljava/lang/ClassLoader;Landroid/content/Context;)Ljava/lang/Object;

    .line 71
    sget-object v5, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {p0}, Lcom/example/yuanpeiyu/vpntest/MyApplication;->getBaseContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/secneo/guard/ACall;->at1(Landroid/app/Application;Landroid/content/Context;)V

    .line 73
    :try_start_1
    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x3

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    const v6, 0x40066666

    cmpg-float v5, v5, v6

    if-gtz v5, :cond_1

    .line 74
    sget-object v5, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {v4, v5}, Lcom/secneo/guard/ACall;->set3(Landroid/app/Application;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 80
    :cond_1
    :goto_1
    invoke-static {}, Lcom/secneo/guard/Util;->doProvider()V

    .line 87
    sget-object v5, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {v5}, Landroid/app/Application;->onCreate()V

    .line 90
    :try_start_2
    invoke-virtual {v4}, Lcom/secneo/guard/ACall;->set8()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 97
    .end local v4    # "p":Lcom/secneo/guard/ACall;
    :cond_2
    :goto_2
    return-void

    .line 60
    :catch_0
    move-exception v2

    .line 62
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 63
    const/4 v5, 0x0

    sput-object v5, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    goto :goto_0

    .line 91
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v4    # "p":Lcom/secneo/guard/ACall;
    :catch_1
    move-exception v3

    .line 92
    .local v3, "ex":Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3, v5}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_2

    .line 76
    .end local v3    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v5

    goto :goto_1
.end method

.method public onLowMemory()V
    .locals 1

    .prologue
    .line 120
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 121
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 122
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->onLowMemory()V

    .line 124
    :cond_0
    return-void
.end method

.method public onTerminate()V
    .locals 1

    .prologue
    .line 103
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 105
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 106
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->onTerminate()V

    .line 108
    :cond_0
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 127
    :try_start_0
    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 128
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 129
    sget-object v0, Lcom/example/yuanpeiyu/vpntest/MyApplication;->realApplication:Landroid/app/Application;

    invoke-virtual {v0, p1}, Landroid/app/Application;->onTrimMemory(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    :cond_0
    :goto_0
    return-void

    .line 131
    :catch_0
    move-exception v0

    goto :goto_0
.end method
