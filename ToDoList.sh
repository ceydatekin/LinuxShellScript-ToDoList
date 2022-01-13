#!/bin/bash

username="ceyda"
password="123456"

GirisYap (){
	ENTRY=`zenity --password --username`

	case $? in
        	0)
         		if [ `echo $ENTRY | cut -d'|' -f1` == $username -a `echo $ENTRY | cut -d'|' -f2` == $password ]
         		then 
         			Menu
         		else
         			zenity --warning  --width=200 --height=100 \
					--text="YANLIS KULLANICI ADI VE SIFRE ILE GIRIS YAPTINIZ !!!!"
				fi
			;;
        	1)
            	echo "Giris Yapamadiniz."
			;;
        
	esac

}

GorevEkle () {
	zenity --forms --title="TO DO LIST GOREV EKLE" \
		--text="Lutfen gorev taniminizi giriniz..." \
		--separator="," \
		--add-combo="Gorev Durumu" --combo-values="FALSE" \
		--add-entry="Gorev Tanimi Tek Kelime İle "  \
		--add-entry="Gorev Adi" \
		--add-combo="Onemlilik Derecesi" --combo-values="Cok Onemli|Onemli|Az Onemli|Gerekli|Onemsiz" \
		--add-calendar="Son Bitirme Tarihi" >> addr.txt

	case $? in
    	0)
        	echo "Gorev Eklendi."
     		SC=`zenity --question --width=300 --height=100 \--text="Gorev Basarili bir sekilde eklenmistir. Ana menuye yonlendiriliyorsunuz"` 		
			case $? in
        	 	0)
         			Menu
				;;
        	 	1)
              		echo "BIR HATA MEYDANA GELDI TEKRAR GIRIS YAPINIZ"
              	;;
            esac
        ;;
    	1)
        	echo "Gorev eklenmedi"
		;;
	esac
}


GorevListele () {
	oldifs=$IFS
	IFS=','
	item=($(cat addr.txt|tr '\n' ',' ) )
	IFS=$oldifs
	CHOICE=$(zenity --list --radiolist --title="Zenity List"\
 	--width=640 --height=480 \
 	--column="Yapildi mi?" --column="Gorev Tanimi"  --column="Gorev Adi" --column="Onemlilik Derecesi" --column="Son Gun"  "${item[@]}" )
	if [ -z "CHOICE" ]
	then
  		echo "Secim Olmadi"
  
	else
 		echo "seçiminiz == "$CHOICE
  		sayac=0
  		n=0
  		tmp=0
  		kn=0
  		for i in ${item[@]}
  		do
  
  			if [ $i == $CHOICE ]
  			then
  				tmp=`expr $sayac / 4`
  				n=`expr $tmp + 1`
  				kn=`expr $sayac - 1`
  				echo ${item[$kn]}
  		
  				#sed -i s/"${item[$kn]}"/TRUE/"$n"  addr.txt
  				#sed -i '/^"$CHOICE"/d' addr.txt
				#sed -i '/$satir/d' addr.txt > loglar.txt
				echo "n = $n"
				#sed "$n"d addr.txt >> loglar.txt
				cat addr.txt | head -$n | tail -1 | sed s/FALSE/TRUE/g  >> loglar.txt
				sed -i "$n"d addr.txt
				SC=`zenity --question --width=300 --height=100 \--text="Basarili bir sekilde gorev tamamlanmistir TEBRİKLER :) Menu icin YES Cikmak icin NO butonuna basiniz"`
		
		
				case $? in
        	 		0)
         				Menu
					;;
       	  			1)
              	 		echo "TEKRAR GIRIS YAPINIZ"
					;;
        
				esac

  			fi
  			sayac=`expr $sayac + 1`
 		done
  
	fi
}

bitenler () {
	oldifs=$IFS
	IFS=','
	item=($(cat loglar.txt|tr '\n'  ','  ) )
	IFS=$oldifs
	CHOICE=$(zenity --list --checklist --title="Zenity List"\
 	--width=640 --height=480 \
 	--column="Yapilanlar" --column="Gorev Tanimi" --column="Gorev Adi" --column="Onemlilik Derecesi" --column="Bitis Tarihi"  "${item[@]}" )
	case $? in
		0) 
			SC=`zenity --question --width=300 --height=100 \--text="Menu icin YES Cikmak icin NO butonuna basiniz"` 		
			case $? in
        	 	0)
         			Menu
				;;
        	 	1)	
              		echo "TEKRAR GIRIS YAPINIZ"
              	;;
            esac
		;;
    esac

}


Menu () {

	CHOICE=$(whiptail --menu "To Do Liste HOSGELDİNİZ" 18 60 10 \
  	"A" "Yapilacak bir gorev ekle." \
  	"B" "Yapilacaklari goruntule." \
  	"C" "Şimdiye kadar yapilan görevler" 3>&1 1>&2 2>&3)

	if [ "$CHOICE" == "A" ] 
	then
		GorevEkle
	
	elif [ "$CHOICE" == "B" ]
	then
		GorevListele
	elif [ "$CHOICE" == "C" ]
	then
		bitenler

	else
		echo "Yanliş giriş yaptiniz"
	fi
	
}

GirisYap
