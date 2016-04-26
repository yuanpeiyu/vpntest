.class public Lneo/proxy/DistributeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ReceiverTemplate.java"


# instance fields
.field private realReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lneo/proxy/DistributeReceiver;->realReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 45
    invoke-static {}, Lcom/secneo/guard/Util;->getCustomClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 47
    .local v1, "cl":Ljava/lang/ClassLoader;
    if-nez v1, :cond_0

    .line 48
    invoke-static {p1}, Lcom/secneo/guard/Util;->runAll(Landroid/content/Context;)V

    .line 52
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/secneo/guard/Util;->getCustomClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 54
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/BroadcastReceiver;

    iput-object v3, p0, Lneo/proxy/DistributeReceiver;->realReceiver:Landroid/content/BroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    iget-object v3, p0, Lneo/proxy/DistributeReceiver;->realReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v3, :cond_1

    .line 72
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v3

    iget-object v4, p0, Lneo/proxy/DistributeReceiver;->realReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, p0, v4}, Lcom/secneo/guard/ACall;->c1(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    iget-object v3, p0, Lneo/proxy/DistributeReceiver;->realReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, p1, p2}, Landroid/content/BroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 76
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v3

    iget-object v4, p0, Lneo/proxy/DistributeReceiver;->realReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, p0, v4}, Lcom/secneo/guard/ACall;->c2(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 87
    :cond_1
    return-void

    .line 55
    :catch_0
    move-exception v2

    .line 56
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 57
    const/4 v3, 0x0

    iput-object v3, p0, Lneo/proxy/DistributeReceiver;->realReceiver:Landroid/content/BroadcastReceiver;

    goto :goto_0
.end method
