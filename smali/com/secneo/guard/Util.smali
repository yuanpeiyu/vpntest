.class public Lcom/secneo/guard/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field private static BUILD_TIME:Ljava/lang/String;

.field public static CPUABI:Ljava/lang/String;

.field private static VERSION_NAME:Ljava/lang/String;

.field private static cl:Ljava/lang/ClassLoader;

.field static hexDigits:[B

.field public static isX86:Z

.field private static ps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProvider;",
            ">;"
        }
    .end annotation
.end field

.field public static x86Ctx:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 41
    sput-object v1, Lcom/secneo/guard/Util;->cl:Ljava/lang/ClassLoader;

    .line 42
    const-string v0, "1.0"

    sput-object v0, Lcom/secneo/guard/Util;->VERSION_NAME:Ljava/lang/String;

    .line 43
    const-string v0, "2016-01-2610:48:21"

    sput-object v0, Lcom/secneo/guard/Util;->BUILD_TIME:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/secneo/guard/Util;->ps:Ljava/util/ArrayList;

    .line 46
    sput-object v1, Lcom/secneo/guard/Util;->x86Ctx:Landroid/content/Context;

    .line 538
    const/4 v0, 0x0

    sput-boolean v0, Lcom/secneo/guard/Util;->isX86:Z

    .line 777
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/secneo/guard/Util;->hexDigits:[B

    .line 887
    sput-object v1, Lcom/secneo/guard/Util;->CPUABI:Ljava/lang/String;

    return-void

    .line 777
    nop

    :array_0
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static CopyArmLib(Landroid/content/Context;)V
    .locals 11
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 496
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v0, v9, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 497
    .local v0, "apkFilePath":Ljava/lang/String;
    const/4 v6, 0x0

    .line 499
    .local v6, "jarFile":Ljava/util/jar/JarFile;
    :try_start_0
    new-instance v7, Ljava/util/jar/JarFile;

    invoke-direct {v7, v0}, Ljava/util/jar/JarFile;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 500
    .end local v6    # "jarFile":Ljava/util/jar/JarFile;
    .local v7, "jarFile":Ljava/util/jar/JarFile;
    const/4 v4, 0x0

    .line 501
    .local v4, "jarEntry":Ljava/util/jar/JarEntry;
    :try_start_1
    invoke-virtual {v7}, Ljava/util/jar/JarFile;->entries()Ljava/util/Enumeration;

    move-result-object v3

    .line 502
    .local v3, "iter":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/jar/JarEntry;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 503
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    check-cast v4, Ljava/util/jar/JarEntry;

    .line 504
    .restart local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    invoke-virtual {v4}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v5

    .line 505
    .local v5, "jarEntryName":Ljava/lang/String;
    const-string v9, "assets/libsecexe.so"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 506
    const-string v9, "assets/"

    const-string v10, ""

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 508
    .local v8, "soName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 510
    .local v1, "destSoName":Ljava/lang/String;
    invoke-static {v1, v7, v4}, Lcom/secneo/guard/Util;->realCopy(Ljava/lang/String;Ljava/util/jar/JarFile;Ljava/util/zip/ZipEntry;)V

    .line 513
    .end local v1    # "destSoName":Ljava/lang/String;
    .end local v8    # "soName":Ljava/lang/String;
    :cond_1
    const-string v9, "assets/libsecmain.so"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 514
    const-string v9, "assets/"

    const-string v10, ""

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 516
    .restart local v8    # "soName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "libsecmain.so"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 518
    .restart local v1    # "destSoName":Ljava/lang/String;
    invoke-static {v1, v7, v4}, Lcom/secneo/guard/Util;->realCopy(Ljava/lang/String;Ljava/util/jar/JarFile;Ljava/util/zip/ZipEntry;)V

    .line 521
    .end local v1    # "destSoName":Ljava/lang/String;
    .end local v8    # "soName":Ljava/lang/String;
    :cond_2
    const-string v9, "assets/libsecpreload.so"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 522
    const-string v9, "assets/"

    const-string v10, ""

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 524
    .restart local v8    # "soName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "libsecpreload.so"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 526
    .restart local v1    # "destSoName":Ljava/lang/String;
    invoke-static {v1, v7, v4}, Lcom/secneo/guard/Util;->realCopy(Ljava/lang/String;Ljava/util/jar/JarFile;Ljava/util/zip/ZipEntry;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 531
    .end local v1    # "destSoName":Ljava/lang/String;
    .end local v3    # "iter":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/jar/JarEntry;>;"
    .end local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    .end local v5    # "jarEntryName":Ljava/lang/String;
    .end local v8    # "soName":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v6, v7

    .line 533
    .end local v7    # "jarFile":Ljava/util/jar/JarFile;
    .local v2, "e":Ljava/io/IOException;
    .restart local v6    # "jarFile":Ljava/util/jar/JarFile;
    :goto_1
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 536
    .end local v2    # "e":Ljava/io/IOException;
    :goto_2
    return-void

    .end local v6    # "jarFile":Ljava/util/jar/JarFile;
    .restart local v3    # "iter":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/jar/JarEntry;>;"
    .restart local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    .restart local v7    # "jarFile":Ljava/util/jar/JarFile;
    :cond_3
    move-object v6, v7

    .line 534
    .end local v7    # "jarFile":Ljava/util/jar/JarFile;
    .restart local v6    # "jarFile":Ljava/util/jar/JarFile;
    goto :goto_2

    .line 531
    .end local v3    # "iter":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/jar/JarEntry;>;"
    .end local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    :catch_1
    move-exception v2

    goto :goto_1
.end method

.method private static CopyBinaryFile(Landroid/content/Context;)V
    .locals 10
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 634
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/data/data/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/.cache/classes.jar"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 636
    .local v3, "jarFileName":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/data/data/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/.cache/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 638
    .local v4, "myDexOptFile":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/data/data/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/.cache/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".art"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 641
    .local v0, "dex2oat":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 642
    .local v2, "jarFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-nez v6, :cond_0

    .line 643
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 647
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6
    const/4 v6, 0x0
    if-nez v6, :cond_1

    .line 648
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v8

    iget-object v8, v8, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/secneo/guard/ACall;->a1([B[B)V

    .line 657
    :cond_1
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "chmod 755 "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    .line 659
    .local v5, "proc":Ljava/lang/Process;
    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I

    .line 660
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "chmod 755 "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    .line 662
    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I

    .line 663
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "chmod 755 "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".20"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    .line 665
    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 676
    .end local v5    # "proc":Ljava/lang/Process;
    :goto_0
    return-void

    .line 666
    :catch_0
    move-exception v1

    .line 668
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 669
    .end local v1    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 671
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method private static CopyLib(Landroid/content/Context;)V
    .locals 11
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 444
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget-object v0, v9, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 445
    .local v0, "apkFilePath":Ljava/lang/String;
    const/4 v6, 0x0

    .line 447
    .local v6, "jarFile":Ljava/util/jar/JarFile;
    :try_start_0
    new-instance v7, Ljava/util/jar/JarFile;

    invoke-direct {v7, v0}, Ljava/util/jar/JarFile;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 448
    .end local v6    # "jarFile":Ljava/util/jar/JarFile;
    .local v7, "jarFile":Ljava/util/jar/JarFile;
    const/4 v4, 0x0

    .line 449
    .local v4, "jarEntry":Ljava/util/jar/JarEntry;
    :try_start_1
    invoke-virtual {v7}, Ljava/util/jar/JarFile;->entries()Ljava/util/Enumeration;

    move-result-object v3

    .line 450
    .local v3, "iter":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/jar/JarEntry;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 451
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    check-cast v4, Ljava/util/jar/JarEntry;

    .line 452
    .restart local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    invoke-virtual {v4}, Ljava/util/jar/JarEntry;->getName()Ljava/lang/String;

    move-result-object v5

    .line 453
    .local v5, "jarEntryName":Ljava/lang/String;
    const-string v9, "assets/libsecexe.x86.so"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 454
    const-string v9, "assets/"

    const-string v10, ""

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 456
    .local v8, "soName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 458
    .local v1, "destSoName":Ljava/lang/String;
    invoke-static {v1, v7, v4}, Lcom/secneo/guard/Util;->realCopy(Ljava/lang/String;Ljava/util/jar/JarFile;Ljava/util/zip/ZipEntry;)V

    .line 461
    .end local v1    # "destSoName":Ljava/lang/String;
    .end local v8    # "soName":Ljava/lang/String;
    :cond_1
    const-string v9, "assets/libsecmain.x86.so"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 462
    const-string v9, "assets/"

    const-string v10, ""

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 464
    .restart local v8    # "soName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "libsecmain.x86.so"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 466
    .restart local v1    # "destSoName":Ljava/lang/String;
    invoke-static {v1, v7, v4}, Lcom/secneo/guard/Util;->realCopy(Ljava/lang/String;Ljava/util/jar/JarFile;Ljava/util/zip/ZipEntry;)V

    .line 469
    .end local v1    # "destSoName":Ljava/lang/String;
    .end local v8    # "soName":Ljava/lang/String;
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "assets/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ".x86"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 470
    const-string v9, "assets/"

    const-string v10, ""

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 472
    .restart local v8    # "soName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 474
    .restart local v1    # "destSoName":Ljava/lang/String;
    invoke-static {v1, v7, v4}, Lcom/secneo/guard/Util;->realCopy(Ljava/lang/String;Ljava/util/jar/JarFile;Ljava/util/zip/ZipEntry;)V

    .line 478
    .end local v1    # "destSoName":Ljava/lang/String;
    .end local v8    # "soName":Ljava/lang/String;
    :cond_3
    const-string v9, "assets/libsecpreload.x86.so"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 479
    const-string v9, "assets/"

    const-string v10, ""

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 481
    .restart local v8    # "soName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "libsecpreload.x86.so"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 483
    .restart local v1    # "destSoName":Ljava/lang/String;
    invoke-static {v1, v7, v4}, Lcom/secneo/guard/Util;->realCopy(Ljava/lang/String;Ljava/util/jar/JarFile;Ljava/util/zip/ZipEntry;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 489
    .end local v1    # "destSoName":Ljava/lang/String;
    .end local v3    # "iter":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/jar/JarEntry;>;"
    .end local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    .end local v5    # "jarEntryName":Ljava/lang/String;
    .end local v8    # "soName":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v6, v7

    .line 491
    .end local v7    # "jarFile":Ljava/util/jar/JarFile;
    .local v2, "e":Ljava/io/IOException;
    .restart local v6    # "jarFile":Ljava/util/jar/JarFile;
    :goto_1
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 494
    .end local v2    # "e":Ljava/io/IOException;
    :goto_2
    return-void

    .end local v6    # "jarFile":Ljava/util/jar/JarFile;
    .restart local v3    # "iter":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/jar/JarEntry;>;"
    .restart local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    .restart local v7    # "jarFile":Ljava/util/jar/JarFile;
    :cond_4
    move-object v6, v7

    .line 492
    .end local v7    # "jarFile":Ljava/util/jar/JarFile;
    .restart local v6    # "jarFile":Ljava/util/jar/JarFile;
    goto :goto_2

    .line 489
    .end local v3    # "iter":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/util/jar/JarEntry;>;"
    .end local v4    # "jarEntry":Ljava/util/jar/JarEntry;
    :catch_1
    move-exception v2

    goto :goto_1
.end method

.method public static addProvider(Landroid/content/ContentProvider;)V
    .locals 2
    .param p0, "p"    # Landroid/content/ContentProvider;

    .prologue
    .line 49
    sget-object v1, Lcom/secneo/guard/Util;->ps:Ljava/util/ArrayList;

    monitor-enter v1

    .line 51
    :try_start_0
    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/secneo/guard/Util;->x86Ctx:Landroid/content/Context;

    .line 52
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/secneo/guard/ACall;->set5(Landroid/content/ContentProvider;)V

    .line 53
    monitor-exit v1

    .line 54
    return-void

    .line 53
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static calFileMD5(Ljava/lang/String;)[B
    .locals 6
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 800
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 801
    .local v1, "input":Ljava/io/FileInputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 802
    .local v3, "out":Ljava/io/ByteArrayOutputStream;
    const v5, 0x8000

    new-array v0, v5, [B

    .line 803
    .local v0, "buffer":[B
    const/4 v4, 0x0

    .line 804
    .local v4, "readed":I
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    if-lez v4, :cond_0

    .line 805
    const/4 v5, 0x0

    invoke-virtual {v3, v0, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 807
    :cond_0
    const-string v5, "MD5"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 808
    .local v2, "md":Ljava/security/MessageDigest;
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/security/MessageDigest;->update([B)V

    .line 809
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    return-object v5
.end method

.method private static checkSpace(Landroid/content/Context;)V
    .locals 9
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 612
    invoke-static {p0}, Lcom/secneo/guard/Util;->isSpaceEnough(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 615
    invoke-static {}, Lcom/secneo/guard/Util;->getDataSize()J

    move-result-wide v4

    .line 616
    .local v4, "size":J
    invoke-static {p0}, Lcom/secneo/guard/Util;->getClassesJarSize(Landroid/content/Context;)J

    move-result-wide v0

    .line 617
    .local v0, "classSize":J
    const-string v6, "SecApk"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Insufficient Space For SecApk available size:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " classSize"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 620
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    .line 621
    .local v3, "r":Ljava/lang/Runtime;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "kill -9 "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 628
    .end local v0    # "classSize":J
    .end local v3    # "r":Ljava/lang/Runtime;
    .end local v4    # "size":J
    :cond_0
    :goto_0
    return-void

    .line 623
    .restart local v0    # "classSize":J
    .restart local v4    # "size":J
    :catch_0
    move-exception v2

    .line 624
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static checkUpdate(Landroid/content/Context;)V
    .locals 12
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 342
    :try_start_0
    new-instance v1, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 344
    .local v1, "f":Ljava/io/File;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 346
    .local v5, "pinfo":Landroid/content/pm/PackageInfo;
    iget v7, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 347
    .local v7, "versionCode":I
    iget-object v8, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 349
    .local v8, "versionName":Ljava/lang/String;
    if-nez v8, :cond_0

    .line 350
    sget-object v8, Lcom/secneo/guard/Util;->VERSION_NAME:Ljava/lang/String;

    .line 354
    :cond_0
    new-instance v2, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.sec_version"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v2, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 357
    .local v2, "fversion":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_2

    .line 358
    invoke-static {v1}, Lcom/secneo/guard/Util;->deleteDirectory(Ljava/io/File;)Z

    .line 359
    invoke-static {v2, v7, v8}, Lcom/secneo/guard/Util;->writeVersion(Ljava/io/File;ILjava/lang/String;)V

    .line 395
    .end local v5    # "pinfo":Landroid/content/pm/PackageInfo;
    .end local v7    # "versionCode":I
    .end local v8    # "versionName":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 361
    .restart local v5    # "pinfo":Landroid/content/pm/PackageInfo;
    .restart local v7    # "versionCode":I
    .restart local v8    # "versionName":Ljava/lang/String;
    :cond_2
    invoke-static {v2}, Lcom/secneo/guard/Util;->readVersions(Ljava/io/File;)[Ljava/lang/String;

    move-result-object v6

    .line 362
    .local v6, "ret":[Ljava/lang/String;
    if-nez v6, :cond_3

    .line 363
    invoke-static {v1}, Lcom/secneo/guard/Util;->deleteDirectory(Ljava/io/File;)Z

    .line 364
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 382
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fversion":Ljava/io/File;
    .end local v5    # "pinfo":Landroid/content/pm/PackageInfo;
    .end local v6    # "ret":[Ljava/lang/String;
    .end local v7    # "versionCode":I
    .end local v8    # "versionName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 384
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 386
    new-instance v1, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 387
    .restart local v1    # "f":Ljava/io/File;
    invoke-static {v1}, Lcom/secneo/guard/Util;->deleteDirectory(Ljava/io/File;)Z

    .line 388
    new-instance v2, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.sec_version"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v2, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 390
    .restart local v2    # "fversion":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 391
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 368
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v5    # "pinfo":Landroid/content/pm/PackageInfo;
    .restart local v6    # "ret":[Ljava/lang/String;
    .restart local v7    # "versionCode":I
    .restart local v8    # "versionName":Ljava/lang/String;
    :cond_3
    const/4 v9, 0x0

    :try_start_1
    aget-object v9, v6, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 369
    .local v3, "localVersionCode":I
    const/4 v9, 0x1

    aget-object v4, v6, v9

    .line 370
    .local v4, "localVersionName":Ljava/lang/String;
    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    if-eq v3, v7, :cond_1

    .line 376
    :cond_4
    invoke-static {v1}, Lcom/secneo/guard/Util;->deleteDirectory(Ljava/io/File;)Z

    .line 377
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private static checkX86(Landroid/content/Context;)V
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 541
    invoke-static {}, Lcom/secneo/guard/Util;->getCPUABI()Ljava/lang/String;

    move-result-object v2

    .line 542
    .local v2, "cpuinfo":Ljava/lang/String;
    const-string v5, "x86"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 543
    const/4 v5, 0x1

    sput-boolean v5, Lcom/secneo/guard/Util;->isX86:Z

    .line 545
    :cond_0
    sget-boolean v5, Lcom/secneo/guard/Util;->isX86:Z

    if-eqz v5, :cond_2

    .line 546
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/data/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/.cache/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 548
    .local v4, "libfileName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 549
    .local v3, "libFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 550
    invoke-static {p0}, Lcom/secneo/guard/Util;->CopyLib(Landroid/content/Context;)V

    .line 563
    .end local v3    # "libFile":Ljava/io/File;
    .end local v4    # "libfileName":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 553
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/data/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/.cache/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "libsecexe.so"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 554
    .local v1, "armLibFilename":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 555
    .local v0, "armLibFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 556
    invoke-static {p0}, Lcom/secneo/guard/Util;->CopyArmLib(Landroid/content/Context;)V

    goto :goto_0
.end method

.method private static copyJarFile(Landroid/content/Context;)V
    .locals 12
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 260
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "/data/data/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/.cache/classes.jar"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 264
    .local v6, "jarFileName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v10

    iget-object v0, v10, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 265
    .local v0, "apkFilePath":Ljava/lang/String;
    new-instance v5, Ljava/util/jar/JarFile;

    invoke-direct {v5, v0}, Ljava/util/jar/JarFile;-><init>(Ljava/lang/String;)V

    .line 266
    .local v5, "jar":Ljava/util/jar/JarFile;
    const-string v10, "assets/bangcle_classes.jar"

    invoke-virtual {v5, v10}, Ljava/util/jar/JarFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v2

    .line 268
    .local v2, "entry":Ljava/util/zip/ZipEntry;
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 270
    .local v9, "outfile":Ljava/io/File;
    const/high16 v10, 0x10000

    new-array v1, v10, [B

    .line 271
    .local v1, "buffer":[B
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-virtual {v5, v2}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v4, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 272
    .local v4, "in":Ljava/io/InputStream;
    new-instance v8, Ljava/io/BufferedOutputStream;

    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v8, v10}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 276
    .local v8, "out":Ljava/io/OutputStream;
    :goto_0
    invoke-virtual {v4, v1}, Ljava/io/InputStream;->read([B)I

    move-result v7

    .line 277
    .local v7, "nBytes":I
    if-gtz v7, :cond_0

    .line 281
    invoke-virtual {v8}, Ljava/io/OutputStream;->flush()V

    .line 282
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    .line 283
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 287
    .end local v0    # "apkFilePath":Ljava/lang/String;
    .end local v1    # "buffer":[B
    .end local v2    # "entry":Ljava/util/zip/ZipEntry;
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v5    # "jar":Ljava/util/jar/JarFile;
    .end local v7    # "nBytes":I
    .end local v8    # "out":Ljava/io/OutputStream;
    .end local v9    # "outfile":Ljava/io/File;
    :goto_1
    return-void

    .line 279
    .restart local v0    # "apkFilePath":Ljava/lang/String;
    .restart local v1    # "buffer":[B
    .restart local v2    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v4    # "in":Ljava/io/InputStream;
    .restart local v5    # "jar":Ljava/util/jar/JarFile;
    .restart local v7    # "nBytes":I
    .restart local v8    # "out":Ljava/io/OutputStream;
    .restart local v9    # "outfile":Ljava/io/File;
    :cond_0
    const/4 v10, 0x0

    invoke-virtual {v8, v1, v10, v7}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 284
    .end local v0    # "apkFilePath":Ljava/lang/String;
    .end local v1    # "buffer":[B
    .end local v2    # "entry":Ljava/util/zip/ZipEntry;
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v5    # "jar":Ljava/util/jar/JarFile;
    .end local v7    # "nBytes":I
    .end local v8    # "out":Ljava/io/OutputStream;
    .end local v9    # "outfile":Ljava/io/File;
    :catch_0
    move-exception v3

    .line 285
    .local v3, "ex":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private static createChildProcess(Landroid/content/Context;)V
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 680
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v0, v1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 683
    .local v0, "apkFilePath":Ljava/lang/String;
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/secneo/guard/ACall;->r1([B[B)V

    .line 689
    :try_start_0
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v1

    invoke-virtual {v1}, Lcom/secneo/guard/ACall;->jniCheckRawDexAvailable()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 692
    :goto_0
    return-void

    .line 690
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static deleteDirectory(Ljava/io/File;)Z
    .locals 3
    .param p0, "path"    # Ljava/io/File;

    .prologue
    .line 290
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 291
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 292
    .local v0, "files":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 293
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 294
    aget-object v2, v0, v1

    invoke-static {v2}, Lcom/secneo/guard/Util;->deleteDirectory(Ljava/io/File;)Z

    .line 292
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 296
    :cond_0
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 300
    .end local v0    # "files":[Ljava/io/File;
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v2

    return v2
.end method

.method public static doCheck(Landroid/content/Context;)V
    .locals 16
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 709
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    .line 710
    .local v9, "info":Landroid/content/pm/ApplicationInfo;
    new-instance v1, Ljava/io/File;

    iget-object v14, v9, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    const-string v15, ".md5"

    invoke-direct {v1, v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    .local v1, "checkFile":Ljava/io/File;
    new-instance v12, Ljava/io/File;

    iget-object v14, v9, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    const-string v15, ".cache/classes.dex"

    invoke-direct {v12, v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    .local v12, "targetFile":Ljava/io/File;
    const-string v3, "/data/dalvik-cache/"

    .line 713
    .local v3, "dexPath":Ljava/lang/String;
    const/4 v5, 0x0

    .line 715
    .local v5, "dexResult":[B
    new-instance v4, Ljava/io/File;

    const-string v14, "/data/dalvik-cache/arm/"

    invoke-direct {v4, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 716
    .local v4, "dexPathFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_0

    .line 717
    const-string v3, "/data/dalvik-cache/arm/"

    .line 721
    :cond_0
    new-instance v0, Ljava/lang/String;

    iget-object v14, v9, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v0, v14}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 722
    .local v0, "apkPath":Ljava/lang/String;
    new-instance v11, Ljava/util/StringTokenizer;

    const-string v14, "/"

    invoke-direct {v11, v0, v14}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 724
    .local v11, "st":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v11}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v14

    if-eqz v14, :cond_1

    .line 725
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v14}, Ljava/io/PrintStream;->println()V

    .line 726
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v11}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 727
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "@"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 729
    :cond_1
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "classes.dex"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 731
    const/4 v13, 0x0

    .line 733
    .local v13, "todo":Z
    :try_start_0
    invoke-static {v3}, Lcom/secneo/guard/Util;->calFileMD5(Ljava/lang/String;)[B

    move-result-object v14

    invoke-static {v14}, Lcom/secneo/guard/Util;->toASC([B)[B

    move-result-object v5

    .line 736
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_4

    .line 737
    if-eqz v5, :cond_2

    .line 738
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 739
    .local v2, "chkOut":Ljava/io/FileOutputStream;
    invoke-virtual {v2, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 740
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 741
    const/4 v13, 0x1

    .line 763
    .end local v2    # "chkOut":Ljava/io/FileOutputStream;
    :cond_2
    :goto_1
    if-eqz v13, :cond_3

    .line 764
    new-instance v7, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "/data/data/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "/.cache/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v7, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 765
    .local v7, "f":Ljava/io/File;
    invoke-static {v7}, Lcom/secneo/guard/Util;->deleteDirectory(Ljava/io/File;)Z

    .line 767
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 768
    .restart local v2    # "chkOut":Ljava/io/FileOutputStream;
    invoke-virtual {v2, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 769
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 775
    .end local v2    # "chkOut":Ljava/io/FileOutputStream;
    .end local v7    # "f":Ljava/io/File;
    :cond_3
    :goto_2
    return-void

    .line 744
    :cond_4
    if-eqz v5, :cond_2

    .line 745
    :try_start_2
    invoke-static {v1}, Lcom/secneo/guard/Util;->readFile(Ljava/io/File;)[B

    move-result-object v10

    .line 746
    .local v10, "md5":[B
    if-eqz v10, :cond_2

    .line 747
    array-length v14, v10

    array-length v15, v5

    if-ne v14, v15, :cond_6

    .line 748
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    array-length v14, v10

    if-ge v8, v14, :cond_2

    .line 749
    aget-byte v14, v10, v8

    aget-byte v15, v5, v8
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-eq v14, v15, :cond_5

    .line 750
    const/4 v13, 0x1

    .line 751
    goto :goto_1

    .line 748
    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 755
    .end local v8    # "i":I
    :cond_6
    const/4 v13, 0x1

    goto :goto_1

    .line 760
    .end local v10    # "md5":[B
    :catch_0
    move-exception v6

    .line 761
    .local v6, "ex":Ljava/lang/Exception;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v6, v14}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_1

    .line 770
    .end local v6    # "ex":Ljava/lang/Exception;
    .restart local v7    # "f":Ljava/io/File;
    :catch_1
    move-exception v14

    goto :goto_2
.end method

.method public static doProvider()V
    .locals 2

    .prologue
    .line 57
    sget-object v1, Lcom/secneo/guard/Util;->ps:Ljava/util/ArrayList;

    monitor-enter v1

    .line 59
    :try_start_0
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v0

    invoke-virtual {v0}, Lcom/secneo/guard/ACall;->set4()V

    .line 60
    monitor-exit v1

    .line 61
    return-void

    .line 60
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static getAssetFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "dirstr"    # Ljava/lang/String;

    .prologue
    .line 187
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 188
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 190
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 191
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 192
    .local v4, "is":Ljava/io/InputStream;
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 193
    .local v3, "fos":Ljava/io/FileOutputStream;
    const/16 v6, 0x1000

    new-array v0, v6, [B

    .line 194
    .local v0, "buffer":[B
    const/4 v5, 0x0

    .line 195
    .local v5, "len":I
    :goto_0
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 196
    const/4 v6, 0x0

    invoke-virtual {v3, v0, v6, v5}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 200
    .end local v0    # "buffer":[B
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .end local v4    # "is":Ljava/io/InputStream;
    .end local v5    # "len":I
    :catch_0
    move-exception v2

    .line 201
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 202
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 205
    .end local v2    # "e":Ljava/io/IOException;
    :cond_0
    :goto_1
    return-void

    .line 198
    .restart local v0    # "buffer":[B
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "is":Ljava/io/InputStream;
    .restart local v5    # "len":I
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 199
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public static getCPUABI()Ljava/lang/String;
    .locals 7

    .prologue
    .line 890
    sget-object v5, Lcom/secneo/guard/Util;->CPUABI:Ljava/lang/String;

    if-nez v5, :cond_1

    .line 893
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    const-string v6, "getprop ro.product.cpu.abi"

    invoke-virtual {v5, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .line 895
    .local v4, "process":Ljava/lang/Process;
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 897
    .local v3, "ir":Ljava/io/InputStreamReader;
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 898
    .local v2, "input":Ljava/io/BufferedReader;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 900
    .local v0, "abi":Ljava/lang/String;
    const-string v5, "x86"

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 901
    const-string v5, "x86"

    sput-object v5, Lcom/secneo/guard/Util;->CPUABI:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 909
    .end local v0    # "abi":Ljava/lang/String;
    .end local v2    # "input":Ljava/io/BufferedReader;
    .end local v3    # "ir":Ljava/io/InputStreamReader;
    :goto_0
    sget-object v5, Lcom/secneo/guard/Util;->CPUABI:Ljava/lang/String;

    .line 911
    :goto_1
    return-object v5

    .line 903
    .restart local v0    # "abi":Ljava/lang/String;
    .restart local v2    # "input":Ljava/io/BufferedReader;
    .restart local v3    # "ir":Ljava/io/InputStreamReader;
    :cond_0
    :try_start_1
    const-string v5, "arm"

    sput-object v5, Lcom/secneo/guard/Util;->CPUABI:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 906
    .end local v0    # "abi":Ljava/lang/String;
    .end local v2    # "input":Ljava/io/BufferedReader;
    .end local v3    # "ir":Ljava/io/InputStreamReader;
    :catch_0
    move-exception v1

    .line 907
    .local v1, "ex":Ljava/lang/Exception;
    const-string v5, "arm"

    sput-object v5, Lcom/secneo/guard/Util;->CPUABI:Ljava/lang/String;

    goto :goto_0

    .line 911
    .end local v1    # "ex":Ljava/lang/Exception;
    .end local v4    # "process":Ljava/lang/Process;
    :cond_1
    sget-object v5, Lcom/secneo/guard/Util;->CPUABI:Ljava/lang/String;

    goto :goto_1
.end method

.method public static getCPUinfo()Ljava/lang/String;
    .locals 9

    .prologue
    .line 399
    const-string v6, ""

    .line 402
    .local v6, "result":Ljava/lang/String;
    const/4 v7, 0x2

    :try_start_0
    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "/system/bin/cat"

    aput-object v8, v0, v7

    const/4 v7, 0x1

    const-string v8, "/proc/cpuinfo"

    aput-object v8, v0, v7

    .line 403
    .local v0, "args":[Ljava/lang/String;
    new-instance v1, Ljava/lang/ProcessBuilder;

    invoke-direct {v1, v0}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 405
    .local v1, "cmd":Ljava/lang/ProcessBuilder;
    invoke-virtual {v1}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v4

    .line 406
    .local v4, "process":Ljava/lang/Process;
    invoke-virtual {v4}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 407
    .local v3, "in":Ljava/io/InputStream;
    const/16 v7, 0x400

    new-array v5, v7, [B

    .line 408
    .local v5, "re":[B
    :goto_0
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_0

    .line 410
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 412
    :cond_0
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 416
    .end local v0    # "args":[Ljava/lang/String;
    .end local v1    # "cmd":Ljava/lang/ProcessBuilder;
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v4    # "process":Ljava/lang/Process;
    .end local v5    # "re":[B
    :goto_1
    return-object v6

    .line 413
    :catch_0
    move-exception v2

    .line 414
    .local v2, "ex":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private static getClassesJarSize(Landroid/content/Context;)J
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 578
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget-object v0, v4, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 579
    .local v0, "apkFilePath":Ljava/lang/String;
    new-instance v3, Ljava/util/jar/JarFile;

    invoke-direct {v3, v0}, Ljava/util/jar/JarFile;-><init>(Ljava/lang/String;)V

    .line 580
    .local v3, "jarFile":Ljava/util/jar/JarFile;
    const-string v4, "assets/bangcle_classes.jar"

    invoke-virtual {v3, v4}, Ljava/util/jar/JarFile;->getJarEntry(Ljava/lang/String;)Ljava/util/jar/JarEntry;

    move-result-object v2

    .line 581
    .local v2, "jarEntry":Ljava/util/jar/JarEntry;
    invoke-virtual {v2}, Ljava/util/jar/JarEntry;->getSize()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 583
    .end local v0    # "apkFilePath":Ljava/lang/String;
    .end local v2    # "jarEntry":Ljava/util/jar/JarEntry;
    .end local v3    # "jarFile":Ljava/util/jar/JarFile;
    :goto_0
    return-wide v4

    .line 582
    :catch_0
    move-exception v1

    .line 583
    .local v1, "ex":Ljava/lang/Exception;
    const-wide/16 v4, 0x0

    goto :goto_0
.end method

.method public static getCustomClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 117
    sget-object v0, Lcom/secneo/guard/Util;->cl:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method private static getDataSize()J
    .locals 9

    .prologue
    .line 566
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v4

    .line 567
    .local v4, "data":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 568
    .local v5, "fs":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v8

    int-to-long v0, v8

    .line 569
    .local v0, "availableBlocks":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v8

    int-to-long v6, v8

    .line 572
    .local v6, "size":J
    mul-long v2, v0, v6

    .line 573
    .local v2, "availableSize":J
    return-wide v2
.end method

.method public static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
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
    .line 850
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 852
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v4

    if-nez v4, :cond_0

    .line 853
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 855
    :cond_0
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 859
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :goto_1
    return-object v1

    .line 850
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 859
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static getFieldValue(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 864
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static {p0, p2}, Lcom/secneo/guard/Util;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 865
    .local v1, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 870
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :goto_0
    return-object v2

    .line 868
    :catch_0
    move-exception v0

    .line 869
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 870
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static isSpaceEnough(Landroid/content/Context;)Z
    .locals 12
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    .line 588
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/classes.jar"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 590
    .local v3, "classesJarFileName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "/data/data/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/.cache/classes.dex"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 592
    .local v5, "dexFileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 593
    .local v2, "classesJarFile":Ljava/io/File;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 594
    .local v4, "dexFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 603
    :cond_0
    :goto_0
    return v8

    .line 597
    :cond_1
    invoke-static {}, Lcom/secneo/guard/Util;->getDataSize()J

    move-result-wide v6

    .line 598
    .local v6, "size":J
    invoke-static {p0}, Lcom/secneo/guard/Util;->getClassesJarSize(Landroid/content/Context;)J

    move-result-wide v0

    .line 600
    .local v0, "classSize":J
    const-wide/16 v10, 0x4

    mul-long/2addr v10, v0

    cmp-long v9, v10, v6

    if-lez v9, :cond_0

    .line 601
    const/4 v8, 0x0

    goto :goto_0
.end method

.method public static readFile(Ljava/io/File;)[B
    .locals 5
    .param p0, "path"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 789
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 790
    .local v1, "input":Ljava/io/FileInputStream;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 791
    .local v2, "out":Ljava/io/ByteArrayOutputStream;
    const v4, 0x8000

    new-array v0, v4, [B

    .line 792
    .local v0, "buffer":[B
    const/4 v3, 0x0

    .line 793
    .local v3, "readed":I
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 794
    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 796
    :cond_0
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    return-object v4
.end method

.method private static readVersions(Ljava/io/File;)[Ljava/lang/String;
    .locals 5
    .param p0, "f"    # Ljava/io/File;

    .prologue
    .line 324
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 325
    .local v2, "reader":Ljava/io/BufferedReader;
    const/4 v3, 0x2

    new-array v1, v3, [Ljava/lang/String;

    .line 326
    .local v1, "lines":[Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 327
    const/4 v3, 0x1

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 329
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 334
    .end local v1    # "lines":[Ljava/lang/String;
    .end local v2    # "reader":Ljava/io/BufferedReader;
    :goto_0
    return-object v1

    .line 331
    :catch_0
    move-exception v0

    .line 333
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 334
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static realCopy(Ljava/lang/String;Ljava/util/jar/JarFile;Ljava/util/zip/ZipEntry;)V
    .locals 7
    .param p0, "destFileName"    # Ljava/lang/String;
    .param p1, "jar"    # Ljava/util/jar/JarFile;
    .param p2, "entry"    # Ljava/util/zip/ZipEntry;

    .prologue
    .line 422
    :try_start_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 423
    .local v5, "outfile":Ljava/io/File;
    const/high16 v6, 0x10000

    new-array v0, v6, [B

    .line 424
    .local v0, "buffer":[B
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-virtual {p1, p2}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 425
    .local v2, "in":Ljava/io/InputStream;
    new-instance v4, Ljava/io/BufferedOutputStream;

    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 429
    .local v4, "out":Ljava/io/OutputStream;
    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 431
    .local v3, "nBytes":I
    if-gtz v3, :cond_0

    .line 435
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 436
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 437
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 441
    .end local v0    # "buffer":[B
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v3    # "nBytes":I
    .end local v4    # "out":Ljava/io/OutputStream;
    .end local v5    # "outfile":Ljava/io/File;
    :goto_1
    return-void

    .line 433
    .restart local v0    # "buffer":[B
    .restart local v2    # "in":Ljava/io/InputStream;
    .restart local v3    # "nBytes":I
    .restart local v4    # "out":Ljava/io/OutputStream;
    .restart local v5    # "outfile":Ljava/io/File;
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v4, v0, v6, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 438
    .end local v0    # "buffer":[B
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v3    # "nBytes":I
    .end local v4    # "out":Ljava/io/OutputStream;
    .end local v5    # "outfile":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 439
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static runAll(Landroid/content/Context;)V
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 828
    sput-object p0, Lcom/secneo/guard/Util;->x86Ctx:Landroid/content/Context;

    .line 829
    invoke-static {p0}, Lcom/secneo/guard/Util;->doCheck(Landroid/content/Context;)V

    .line 830
    invoke-static {p0}, Lcom/secneo/guard/Util;->checkUpdate(Landroid/content/Context;)V

    .line 833
    :try_start_0
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/data/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/.cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 834
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 835
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 840
    .end local v1    # "f":Ljava/io/File;
    :cond_0
    :goto_0
    invoke-static {p0}, Lcom/secneo/guard/Util;->checkX86(Landroid/content/Context;)V

    .line 844
    invoke-static {p0}, Lcom/secneo/guard/Util;->CopyBinaryFile(Landroid/content/Context;)V

    .line 845
    invoke-static {p0}, Lcom/secneo/guard/Util;->createChildProcess(Landroid/content/Context;)V

    .line 846
    invoke-static {p0}, Lcom/secneo/guard/Util;->tryDo(Landroid/content/Context;)V

    .line 847
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/secneo/guard/Util;->runPkg(Landroid/content/Context;Ljava/lang/String;)V

    .line 848
    return-void

    .line 837
    :catch_0
    move-exception v0

    .line 838
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static runAll1(Landroid/content/Context;)V
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 817
    :try_start_0
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/data/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/.cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 818
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 819
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 824
    .end local v1    # "f":Ljava/io/File;
    :cond_0
    :goto_0
    invoke-static {p0}, Lcom/secneo/guard/Util;->checkX86(Landroid/content/Context;)V

    .line 825
    return-void

    .line 821
    :catch_0
    move-exception v0

    .line 822
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static runPkg(Landroid/content/Context;Ljava/lang/String;)V
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "pkgName"    # Ljava/lang/String;

    .prologue
    .line 122
    const/4 v1, 0x0

    .line 123
    .local v1, "libpath":Ljava/lang/String;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 125
    .local v2, "sdk":I
    const/16 v3, 0x14

    if-lt v2, v3, :cond_1

    .line 126
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v1, v3, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 132
    :goto_0
    :try_start_0
    sget-object v3, Lcom/secneo/guard/Util;->cl:Ljava/lang/ClassLoader;

    if-nez v3, :cond_0

    .line 134
    sget-boolean v3, Lcom/secneo/guard/Util;->isX86:Z

    if-eqz v3, :cond_3

    .line 141
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v3

    invoke-virtual {v3}, Lcom/secneo/guard/ACall;->jniGetRawDexAvailable()Z

    move-result v3

    if-nez v3, :cond_2

    .line 142
    new-instance v3, Lcom/secneo/guard/MyClassLoader;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/.cache/classes.jar"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/data/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/.cache"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-direct {v3, v4, v5, v1, v6}, Lcom/secneo/guard/MyClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    sput-object v3, Lcom/secneo/guard/Util;->cl:Ljava/lang/ClassLoader;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    :cond_0
    :goto_1
    return-void

    .line 128
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/data/data/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/lib/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 148
    :cond_2
    :try_start_1
    new-instance v3, Lcom/secneo/guard/MyClassLoader;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/.cache/classes.dex"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/data/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/.cache/opt"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-direct {v3, v4, v5, v1, v6}, Lcom/secneo/guard/MyClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    sput-object v3, Lcom/secneo/guard/Util;->cl:Ljava/lang/ClassLoader;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 161
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v3

    invoke-virtual {v3}, Lcom/secneo/guard/ACall;->jniGetRawDexAvailable()Z

    move-result v3

    if-nez v3, :cond_4

    .line 162
    new-instance v3, Lcom/secneo/guard/MyClassLoader;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/.cache/classes.jar"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/data/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/.cache"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-direct {v3, v4, v5, v1, v6}, Lcom/secneo/guard/MyClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    sput-object v3, Lcom/secneo/guard/Util;->cl:Ljava/lang/ClassLoader;

    goto/16 :goto_1

    .line 168
    :cond_4
    new-instance v3, Lcom/secneo/guard/MyClassLoader;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/data/data/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/.cache/classes.dex"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/data/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/.cache/opt"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-direct {v3, v4, v5, v1, v6}, Lcom/secneo/guard/MyClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    sput-object v3, Lcom/secneo/guard/Util;->cl:Ljava/lang/ClassLoader;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1
.end method

.method public static setFieldValue(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 875
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setFieldValue"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 876
    if-nez p2, :cond_0

    .line 886
    :goto_0
    return-void

    .line 878
    :cond_0
    :try_start_0
    invoke-static {p0, p2}, Lcom/secneo/guard/Util;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 879
    .local v1, "f":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 880
    invoke-virtual {v1, p1, p3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 883
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    .line 884
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static toASC([B)[B
    .locals 6
    .param p0, "bts"    # [B

    .prologue
    .line 779
    array-length v3, p0

    mul-int/lit8 v3, v3, 0x2

    new-array v2, v3, [B

    .line 780
    .local v2, "ret":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 781
    aget-byte v0, p0, v1

    .line 782
    .local v0, "b":B
    mul-int/lit8 v3, v1, 0x2

    sget-object v4, Lcom/secneo/guard/Util;->hexDigits:[B

    shr-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0xf

    aget-byte v4, v4, v5

    aput-byte v4, v2, v3

    .line 783
    mul-int/lit8 v3, v1, 0x2

    add-int/lit8 v3, v3, 0x1

    sget-object v4, Lcom/secneo/guard/Util;->hexDigits:[B

    and-int/lit8 v5, v0, 0xf

    aget-byte v4, v4, v5

    aput-byte v4, v2, v3

    .line 780
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 785
    .end local v0    # "b":B
    :cond_0
    return-object v2
.end method

.method private static tryDo(Landroid/content/Context;)V
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 695
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v0, v1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 699
    .local v0, "apkFilePath":Ljava/lang/String;
    invoke-static {}, Lcom/secneo/guard/ACall;->getACall()Lcom/secneo/guard/ACall;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget-object v4, v4, Landroid/content/pm/ApplicationInfo;->processName:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/secneo/guard/ACall;->r2([B[B[B)V

    .line 705
    return-void
.end method

.method private static writeVersion(Ljava/io/File;ILjava/lang/String;)V
    .locals 4
    .param p0, "f"    # Ljava/io/File;
    .param p1, "versionCode"    # I
    .param p2, "versionName"    # Ljava/lang/String;

    .prologue
    .line 306
    :try_start_0
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/FileWriter;

    invoke-direct {v3, p0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 307
    .local v0, "bw":Ljava/io/BufferedWriter;
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 308
    .local v2, "vcode":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 309
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->newLine()V

    .line 310
    invoke-virtual {v0, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 311
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->flush()V

    .line 312
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    .end local v0    # "bw":Ljava/io/BufferedWriter;
    .end local v2    # "vcode":Ljava/lang/String;
    :goto_0
    return-void

    .line 313
    :catch_0
    move-exception v1

    .line 315
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
