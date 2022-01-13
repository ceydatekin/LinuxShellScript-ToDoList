# Linux Shell Programlama Projesi : TO DO LIST 

* Linux shell script, whiptail ve Zenity kütüphanesi ile yazılan, basit TO DO LIST programıdır. Programın YouTube videosu ile açıklanmış hali <a href="https://youtu.be/dTfYojtNAXU">linktedir.</a>
## Gerekli Kurulumlar
* GNU LINUX'da `ctrl+alt+t` ile terminali açabilirsiniz. 
* `apt-get install whiptail` komutu ile Whiptail'i çalışma ortamınıza kurabilirsiniz.
* `sudo apt-get install -y zenity` komutu ile Zenity'i çalışma ortamınıza kurabilirsiniz.
* Projede gerekli kütüphaneleri indirdikten sonra proje dosyalarına erişmek ve bunları yerel bilgisayarınızda çalıştırmak için aşağıdaki adımı uygulayabilirsiniz:
* Deponun sağ üst kısmında `Kod`, yazan yeşil butona tıkladıktan sonra ZIP İndir sekmesine tıklayıp yerel bilgisayarınıza proje kaynak kodlarını indirmiş olursunuz.
* Dizinin kaynak kodunu açtıktan sonra, Dosyanıza `chmod +x ToDolist.sh`komutu ile yürütme/çalıştırma yetkisi verip `bash ToDoList.sh ` komutu ile çalıştırabilirsiniz.
## Nasıl Geliştirildi?
>Bir Shell Script dosyasında geliştirilmiş bir uygulamadır.
> Shell Script dosyası oluşturmak için `nano file_name.sh`komutu ile Shell Script dosyanızı bir `nano` editör ile oluşturup açıyoruz. Dosyanızın en başına `#!/bin/bash` yazınız. Daha sonra dosyanıza `chmod +x file_name.sh` komutu ile yürütme yetkisi veriniz. Dosyanızı  `bash FileName.sh` komutuyla çalıştırabilirsiniz.
> Shell Scripti etkileşimli hale getirmek ve daha anlaşılır tam ekran mesajlar görüntülemekisteriz.  `Whiptail` ve `Zenity` kütüphanelerini kullanarak, kabuk komut dosyasındaki iletişim kutularını kullanarak çeşitli sorular sunmanıza veya mesajları görüntülemenize izin verecek programlardır.

## To Do List Özellikleri
:round_pushpin: Dosyanızı Çalıştırdığınızda ilk önce karşınıza resimde görüldüğü gibi kimlik doğrulaması gelecektir. To Do List Shell Script doyamdali giriş bilgileri aşağıdaki gibidir.
>username="ceyda"
>password="123456"

![1](https://user-images.githubusercontent.com/54938901/149312374-d324589b-11ec-4d32-840a-ca6636acfd80.png)
:round_pushpin:Hatalı giriş yapmanız durumunda aşağıdaki resimdeki uyarıyı göreceksiniz.
![2](https://user-images.githubusercontent.com/54938901/149312378-5381b201-d1db-42e2-b4dc-71f02d35f69d.png)
:round_pushpin:Doğru giriş yaptığınızda ise karşınıza `whiptail`ile oluşturulan bir menü çıkacaktır. Menüde `aşağı-yukarı` yön tuşları ile seçiminizi belirtip `enter` tuşu ile seçebilirsiniz. Menüden çıkmak için `sağ-sol` yön tuşları ile `cancel`butonunu seçebilirsiniz.
:round_pushpin:Menüdeki seçenekler şu şekildedir.
> A. Yapılacak bir görev ekleyiniz.
> B. Yapılacaklari listeleyiniz.
> C. Şimdiye kadar yapılan görevleri listeleyiniz.
> 
![3](https://user-images.githubusercontent.com/54938901/149312387-662858c0-fa97-4a7f-acec-f090fb6de805.png)
:round_pushpin:İlgili alanlar seçildiğinde gerekli fonksiyonlar çalışır. Menü ekranının görüntüsü aşağıdaki gibidir.
:round_pushpin:A. seçeneğini seçerseniz Görev durumu  default olrak`FALSE` olarak tanımlanan sonrasında görevinize özgü `unique(benzersiz)` bir tanımlama veya id girmenizi istedikten sonra görev adı, önemlilik derecesi ve son bitirme tarihini girebiliyorsunuz. Tamam tuşuna bastıktan sonra karşınıza `Tebrikler ekleme tamamlandı tekrar menüye dönmek ister misiniz?` şeklinde bir uyarı mesajı gelmektedir. Siz menüye dönmek için `tamam`tuşuna uygulamadan çıkmak için `hayır` tuşuna basmalısınız.
![4](https://user-images.githubusercontent.com/54938901/149312391-95483b84-95cb-4c6e-b2f5-5d60f3dc7968.png)
![5](https://user-images.githubusercontent.com/54938901/149312382-06a63fc8-a4fa-49a4-a58e-68ace25c9708.png)
:round_pushpin:B. seçeneğini seçerseniz yapılacak görevler listelenmektedir. Bitirdiğiniz görevi seçip tamama tıklarsanız yaptığınız her görev yapılacak listesinden kaldırılıp yapılanlar listesine eklenecektir. Biten görev sonrası uyarı mesajı ile tekrar menüye dönmek istediğinizi sormaktadır. Siz menüye dönmek için `tamam`tuşuna uygulamadan çıkmak için `hayır` tuşuna basmalısınız.
![6](https://user-images.githubusercontent.com/54938901/149312389-753d60c0-cf97-4e79-a9c4-d61eaecce5e7.png)
![7](https://user-images.githubusercontent.com/54938901/149312396-f9c2d27c-e1e0-4da5-bc6b-01936c58d276.png)
:round_pushpin:C. seçeneğini seçerseniz bugüne kadar yaptığınız tüm görevlerin listesini görebileceksiniz.
![8](https://user-images.githubusercontent.com/54938901/149312400-540935e1-2023-4b79-a47c-4f8c6214fbfa.png)
## Proje Detayı

> Projemize bir Shell Script dosyası oluşturarak başladık. Oluşturduğumuz dosyanın başına `#!/bin/bash` komutunu ekledik. Bu projede 5 temel fonksiyon oluşturduk. Bu fonksiyonlar Şu şekildedir:
 - [ ] `GirisYap` Fonksiyonu ***zenity --password --username***  yapısı ile kullanıcıdan bir giriş alan ve sistemde önceden tanımlanmış *kullanıcı adı* ve *password* ile doğrulayıp menü'yü görüntüleminizi sağlar.
 - [ ] `GorevEkle` Fonksiyonu ***zenity --form*** yapısı ile oluşturulmuştur. Kullanıcıdan girişleri *--add-combo=çoklu seçim sağlar --add-entry=metin giriş ekranı --add-calendar=Takvim giriş ekranı* görevindedir. Alınan bu bilgileri `addr.txt` isimli klasörde tutmaktadır.
 - [ ] `GorevListele`Fonksiyonu `addr.txt`isimli dosyayı " , " ile ayırarak okuyup ***zenity --list--radiolist*** yapısı ile listelemektedir. Seçim yapıldığında seçime göre bulunan sıra önce G"örev Yapılma Durumu" `TRUE` durumuna çevrilir ve listeden kaldırılıp `loglar.txt` dosyasında tutulur.
 - [ ] `BitenGorevler`Fonksiyonu loglar.txt isimli dosyayı " , " ile ayırarak okuyup ***zenity --list--checklist*** yapısı ile listelemektedir.
 - [ ] `Menu` Fonksiyonu ***whiptail --menu*** yapısı ile menü oluşturmamızı sağlamıştır.


