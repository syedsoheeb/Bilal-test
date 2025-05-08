import 'dart:math';
import 'package:flutter/material.dart';
import '../models/models.dart';

class DhikrService {
  // Morning Azkar
  List<DhikrEntry> getMorningAzkar() {
    return [
      DhikrEntry(
        id: 1,
        arabic: 'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
        translation: 'We have reached the morning and at this very time all sovereignty belongs to Allah, Lord of the worlds. All praise is for Allah. None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise and He is over all things omnipotent.',
        transliteration: "Asbahna wa asbahal-mulku lillah, walhamdu lillah, la ilaha illallahu wahdahu la shareeka lah, lahul-mulku walahul-hamd, wahuwa ala kulli shayin qadeer.",
        benefit: 'Remembrance of Allah's sovereignty and power in the morning',
        source: 'Muslim',
        count: 1,
        category: 'morning',
      ),
      DhikrEntry(
        id: 2,
        arabic: 'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَٰهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَىٰ عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ',
        translation: 'O Allah, You are my Lord, none has the right to be worshipped except You, You created me and I am Your servant and I abide to Your covenant and promise as best I can, I take refuge in You from the evil of which I have committed. I acknowledge Your favor upon me and I acknowledge my sin, so forgive me, for verily none can forgive sins except You.',
        transliteration: "Allahumma anta rabbi la ilaha illa ant, khalaqtani wa ana abduk, wa ana ala ahdika wa wadika mastata't, a'udhu bika min sharri ma sana't, abu'u laka bini'matika alay, wa abu'u bidhanbi faghfir li fainnahu la yaghfirudh-dhunuba illa ant.",
        benefit: 'Seeking forgiveness and acknowledging Allah's favor',
        source: 'Bukhari',
        count: 1,
        category: 'morning',
      ),
      DhikrEntry(
        id: 3,
        arabic: 'اللَّهُمَّ عَالِمَ الْغَيْبِ وَالشَّهَادَةِ فَاطِرَ السَّمَاوَاتِ وَالْأَرْضِ، رَبَّ كُلِّ شَيْءٍ وَمَلِيكَهُ، أَشْهَدُ أَنْ لَا إِلَٰهَ إِلَّا أَنْتَ، أَعُوذُ بِكَ مِنْ شَرِّ نَفْسِي، وَمِنْ شَرِّ الشَّيْطَانِ وَشِرْكِهِ، وَأَنْ أَقْتَرِفَ عَلَىٰ نَفْسِي سُوءًا، أَوْ أَجُرَّهُ إِلَىٰ مُسْلِمٍ',
        translation: 'O Allah, Knower of the unseen and the seen, Creator of the heavens and the Earth, Lord and Sovereign of all things, I bear witness that none has the right to be worshipped except You. I take refuge in You from the evil of my soul and from the evil and shirk of the devil, and from committing wrong against my soul or bringing such upon another Muslim.',
        transliteration: "Allahumma alimat-ghaybi wash-shahadah, fatiras-samawati wal-ard, rabba kulli shayin wa malikah, ashhadu an la ilaha illa ant, a'udhu bika min sharri nafsi, wa min sharrish-shaytani wa shirkih, wa an aqtarifa ala nafsi su'an, aw ajurrahu ila muslim.",
        benefit: 'Seeking refuge from evil and shirk',
        source: 'Abu Dawud and At-Tirmidhi',
        count: 1,
        category: 'morning',
      ),
    ];
  }

  // Evening Azkar
  List<DhikrEntry> getEveningAzkar() {
    return [
      DhikrEntry(
        id: 4,
        arabic: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
        translation: 'I take refuge in Allah's perfect words from the evil that He has created.',
        transliteration: "A'udhu bikalimatil-lahit-tammati min sharri ma khalaq.",
        benefit: 'Protection from all evil',
        source: 'Muslim',
        count: 3,
        category: 'evening',
      ),
      DhikrEntry(
        id: 5,
        arabic: 'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ، وَهُوَ السَّمِيعُ الْعَلِيمُ',
        translation: 'In the name of Allah with whose name nothing is harmed on earth nor in the heavens and He is The All-Hearing, The All-Knowing.',
        transliteration: "Bismil-lahil-ladhi la yadurru ma'as-mihi shayun fil-ardi wa la fis-sama'i, wa huwas-sami'ul-alim.",
        benefit: 'Protection from all harm',
        source: 'Abu Dawud and At-Tirmidhi',
        count: 3,
        category: 'evening',
      ),
    ];
  }

  // Daily Dhikr
  List<DhikrEntry> getDailyDhikr() {
    return [
      DhikrEntry(
        id: 6,
        arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ',
        translation: 'Glory is to Allah and praise is to Him, Glory is to Allah the Almighty.',
        transliteration: "Subhan-Allahi wa bihamdihi, Subhan-Allahil-Adheem.",
        benefit: 'A tree is planted in Paradise for the one who says this',
        source: 'Muslim',
        count: 100,
        category: 'daily',
      ),
      DhikrEntry(
        id: 7,
        arabic: 'أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ، بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ، قُلْ أَعُوذُ بِرَبِّ النَّاسِ، مَلِكِ النَّاسِ، إِلَٰهِ النَّاسِ، مِنْ شَرِّ الْوَسْوَاسِ الْخَنَّاسِ، الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ، مِنَ الْجِنَّةِ وَالنَّاسِ',
        translation: 'I seek refuge with Allah from Satan the accursed. In the name of Allah, the Most Gracious, the Most Merciful. Say: I seek refuge with the Lord of mankind, the King of mankind, the God of mankind, from the evil of the whisperer who withdraws, who whispers in the breasts of mankind, from among the jinn and mankind.',
        transliteration: "Bismillahir-rahmanir-rahim. Qul a'udhu birabbin-nas. Malikin-nas. Ilahin-nas. Min sharril-waswaasil-khannas. Alladhi yuwaswisu fi sudurin-nas. Minal-jinnati wan-nas.",
        benefit: 'Protection from evil whispers',
        source: 'Quran 114',
        count: 3,
        category: 'daily',
      ),
      DhikrEntry(
        id: 8,
        arabic: 'آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ، كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ، وَقَالُوا سَمِعْنَا وَأَطَعْنَا، غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ، لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا، لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ، رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا، رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا، رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ، وَاعْفُ عَنَّا، وَاغْفِرْ لَنَا، وَارْحَمْنَا، أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ',
        translation: 'The Messenger has believed in what was revealed to him from his Lord, and so have the believers. All of them have believed in Allah and His angels and His books and His messengers, saying, "We make no distinction between any of His messengers." And they say, "We hear and we obey. We seek Your forgiveness, our Lord, and to You is the final destination." Allah does not charge a soul except with that within its capacity. It will have the consequence of what good it has gained, and it will bear the consequence of what evil it has earned. "Our Lord, do not impose blame upon us if we have forgotten or erred. Our Lord, and lay not upon us a burden like that which You laid upon those before us. Our Lord, and burden us not with that which we have no ability to bear. And pardon us; and forgive us; and have mercy upon us. You are our protector, so give us victory over the disbelieving people."',
        transliteration: "Amanar-rasulu bima unzila ilayhi mir-rabbihi wal-mu'minun. Kullun amana billahi wa mala'ikatihi wa kutubihi wa rusulihi la nufarriqu bayna ahadin mir-rusulihi wa qalu sami'na wa ata'na ghufranaka rabbana wa ilaykal-masir. La yukallifu-llahu nafsan illa wus'aha. Laha ma kasabat wa alayha mak-tasabat. Rabbana la tu'akhidhna in nasina aw akhta'na. Rabbana wa la tahmil alayna isran kama hamaltahu alal-ladhina min qablina. Rabbana wa la tuhammilna ma la taqata lana bihi wa'fu anna, waghfir lana, warhamna. Anta mawlana fansurna alal-qawmil-kafirin.",
        benefit: 'Seeking forgiveness and mercy from Allah',
        source: 'Quran 2:285-286',
        count: 1,
        category: 'daily',
      ),
      DhikrEntry(
        id: 9,
        arabic: 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَالْعَجْزِ وَالْكَسَلِ، وَالْبُخْلِ وَالْجُبْنِ، وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ',
        translation: 'O Allah, I take refuge in You from anxiety and sorrow, weakness and laziness, miserliness and cowardice, the burden of debts and from being overpowered by men.',
        transliteration: "Allahumma inni a'udhu bika minal-hammi wal-hazan, wal-'ajzi wal-kasal, wal-bukhli wal-jubn, wa dala'id-dayni wa ghalabatir-rijal.",
        benefit: 'Seeking refuge from negative feelings and situations',
        source: 'Bukhari',
        count: 1,
        category: 'daily',
      ),
    ];
  }

  // Get a random dhikr from a specific category
  DhikrEntry getRandomDhikr({String category = 'daily'}) {
    List<DhikrEntry> dhikrList = [];
    
    if (category == 'morning') {
      dhikrList = getMorningAzkar();
    } else if (category == 'evening') {
      dhikrList = getEveningAzkar();
    } else {
      dhikrList = getDailyDhikr();
    }
    
    final random = Random();
    return dhikrList[random.nextInt(dhikrList.length)];
  }
}
