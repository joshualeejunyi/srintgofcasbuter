.class public Lcom/sus/srintgofcasbuter/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 24
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001c

    .line 25
    invoke-virtual {p0, p1}, Lcom/sus/srintgofcasbuter/MainActivity;->setContentView(I)V

    const p1, 0x7f080192

    .line 27
    invoke-virtual {p0, p1}, Lcom/sus/srintgofcasbuter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    const v0, 0x7f080194

    .line 28
    invoke-virtual {p0, v0}, Lcom/sus/srintgofcasbuter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f080193

    .line 29
    invoke-virtual {p0, v1}, Lcom/sus/srintgofcasbuter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f080191

    .line 30
    invoke-virtual {p0, v2}, Lcom/sus/srintgofcasbuter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    :try_start_0
    const-string v3, "VTB1VThPcnhWVktSMElRSmNyN3k0T3RxNTRuU3R6cmlpUG04NER0Tkd2Yz0="

    .line 33
    invoke-static {v3}, Lcom/sus/srintgofcasbuter/DontLookHere;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string p1, "YUx0OEl1eXgwUklNZFR0bUVEcGFmVjhJNjZxQm9RdUE3L0Y3cE5IMjFPWFNSb3Bmd0lzMg=="

    .line 34
    invoke-static {p1}, Lcom/sus/srintgofcasbuter/DontLookHere;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string p1, "a0ZvOHNlTFgzUjZyOFZUTXdRN3l4ZkllZkxGS01DY0JBSVFHbDJuc1JUdnF3dVk9"

    .line 35
    invoke-static {p1}, Lcom/sus/srintgofcasbuter/DontLookHere;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string p1, "aXp2U0FzVlRxbVJVQW40VFl0ZUY5OHN0N0V4OXJTZncvQUpWd2tscw=="

    .line 36
    invoke-static {p1}, Lcom/sus/srintgofcasbuter/DontLookHere;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    goto :goto_0

    :catch_2
    move-exception p1

    goto :goto_0

    :catch_3
    move-exception p1

    goto :goto_0

    :catch_4
    move-exception p1

    goto :goto_0

    :catch_5
    move-exception p1

    goto :goto_0

    :catch_6
    move-exception p1

    .line 38
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-void
.end method
