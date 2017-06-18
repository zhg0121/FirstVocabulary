//
//  VocaTableViewCell.swift
//  MxoVocabulary
//
//  Copyright © 2017年 ＭxoStudio. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData
import Foundation

class VocaTableViewController: UITableViewController {

    //http://140.115.197.16/?school=nkfust&app=FirstVocabulary
   
    
    
    var mycontext : NSManagedObjectContext!
    
    func getContext()->NSManagedObjectContext{
        let appDelegate=UIApplication.shared.delegate as!AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var VocaList : [VocaModel] = []
    
    func addVoca(eName: String , cName: String , phonetic: String , img: String){
        let context = getContext()
        var Voca : VocaModel!
        Voca = VocaModel(context: getContext())
        Voca.eName = eName
        Voca.cName = cName
        Voca.phonetic = phonetic
        if let vocaImg = UIImage(named: img){
            if let imgData = UIImageJPEGRepresentation(vocaImg, 1.0){
                Voca.img = NSData(data: imgData)
            }
        }
        do {
            try context.save()
            print(Voca.eName! + " add OK!")
        } catch {
            print(error)
        }
    }
    
    func getVoca(){
        let request : NSFetchRequest<VocaModel> = VocaModel.fetchRequest()
        let context = getContext()
        do {
            VocaList = try context.fetch(request)
            /*for Voca in VocaList{
                print(Voca.eName! + " is loading...")
            }*/
            print("Total: " + String(VocaList.count))
        }catch{
            print(error)
        }
    }
    func delVoca(){
        let request : NSFetchRequest<VocaModel> = VocaModel.fetchRequest()
        let context = getContext()
        do {
            VocaList = try context.fetch(request)
            for Voca in VocaList{
                context.delete(Voca)
            }
            try context.save()
        }catch{
            print(error)
        }
    }
    var InitVoca : [Voca] = [
        Voca(eName:"abacus",cName:"算盤",phonetic:"ˋæbəkəs",img:"abacus.jpg"),
        Voca(eName:"abbey",cName:"修道院",phonetic:"ˋæbɪ",img:"abbey.jpg"),
        Voca(eName:"ache",cName:"痛",phonetic:"ek",img:"ache.jpg"),
        Voca(eName:"acid",cName:"酸",phonetic:"ˋæsɪd",img:"acid.jpg"),
        Voca(eName:"actor",cName:"男演員",phonetic:"ˋæktɚ",img:"actor.png"),
        Voca(eName:"actress",cName:"女演員",phonetic:"ˋæktrɪs",img:"actress.jpg"),
        Voca(eName:"aim",cName:"瞄準",phonetic:"em",img:"aim.png"),
        Voca(eName:"air",cName:"空氣",phonetic:"ɛr",img:"air.jpg"),
        Voca(eName:"airplane",cName:"飛機",phonetic:"ˋɛr͵plen",img:"airplane.jpg"),
        Voca(eName:"aisle",cName:"走廊",phonetic:"aɪl",img:"aisle.jpg"),
        Voca(eName:"album",cName:"相簿",phonetic:"ˋælbəm",img:"album.jpg"),
        Voca(eName:"albumen",cName:"蛋白",phonetic:"ælˋbjumən",img:"albumen.png"),
        Voca(eName:"alcohol",cName:"酒精",phonetic:"ˋælkə͵hɔl",img:"alcohol.jpg"),
        Voca(eName:"alcoholic",cName:"酒鬼",phonetic:"͵ælkəˋhɔlɪk",img:"alcoholic.jpg"),
        Voca(eName:"alien",cName:"外星人",phonetic:"ˋelɪən",img:"alien.jpg"),
        Voca(eName:"all",cName:"全部",phonetic:"ɔl",img:"all.jpg"),
        Voca(eName:"alley",cName:"小巷",phonetic:"ˋælɪ",img:"alley.jpg"),
        Voca(eName:"alveolus",cName:"肺泡",phonetic:"ælˋviələs",img:"alveolus.jpg"),
        Voca(eName:"amazon",cName:"女戰士",phonetic:"ˋæmə͵zɑn",img:"amazon.jpg"),
        Voca(eName:"amethyst",cName:"紫水晶",phonetic:"ˋæməθɪst",img:"amethyst.jpg"),
        Voca(eName:"apple",cName:"蘋果",phonetic:"ˋæp!",img:"apple.jpg"),
        Voca(eName:"approval",cName:"贊同",phonetic:"əˋpruv!",img:"approval.jpg"),
        Voca(eName:"argument",cName:"爭執",phonetic:"ˋɑrgjəmənt",img:"argument.jpg"),
        Voca(eName:"arms",cName:"武器",phonetic:"ɑrmz",img:"arms.jpg"),
        Voca(eName:"ash",cName:"灰燼",phonetic:"æʃ",img:"ash.jpg"),
        Voca(eName:"assassin",cName:"暗殺者",phonetic:"əˋsæsɪn",img:"assassin.jpg"),
        Voca(eName:"attack",cName:"攻擊",phonetic:"əˋtæk",img:"attack.png"),
        Voca(eName:"awning",cName:"遮雨棚",phonetic:"ˋɔnɪŋ",img:"awning.jpg"),
        Voca(eName:"axe",cName:"斧頭",phonetic:"æks",img:"axe.jpg"),
        Voca(eName:"azalea",cName:"杜鵑花",phonetic:"əˋzeljə",img:"azalea.jpg"),
        Voca(eName:"Backward",cName:"向後",phonetic:"ˈbakwərd",img:"backward.jpg"),
        Voca(eName:"Bacteria",cName:"病菌",phonetic:"ˌbakˈtirēəm",img:"bacteria.jpg"),
        Voca(eName:"Badge",cName:"徽章",phonetic:"baj",img:"badge.jpg"),
        Voca(eName:"Badminton",cName:"羽毛球",phonetic:"ˈbadmin(t)n",img:"badminton.jpg"),
        Voca(eName:"Baggage",cName:"行李",phonetic:"ˈbaɡij",img:"baggage.jpg"),
        Voca(eName:"Bait",cName:"誘餌",phonetic:"bāt",img:"bait.jpg"),
        Voca(eName:"Bamboo",cName:"竹子",phonetic:"bamˈbo͞o",img:"bamboo.jpg"),
        Voca(eName:"Barbarian",cName:"野蠻人",phonetic:"ˌbärˈberēən",img:"barbarian.jpg"),
        Voca(eName:"Barbecue",cName:"烤肉",phonetic:"ˈbärbəˌkyo͞o",img:"barbecue.jpg"),
        Voca(eName:"Barber",cName:"理髮師",phonetic:"ˈbärbər",img:"barber.jpg"),
        Voca(eName:"Bartender",cName:"調酒師",phonetic:"bärˌtendər",img:"bartender.jpg"),
        Voca(eName:"Basement",cName:"地下室",phonetic:"ˈbāsmənt",img:"basement.jpg"),
        Voca(eName:"Basketball",cName:"籃球",phonetic:"ˋbæskɪt͵bɔl",img:"basketball.jpg"),
        Voca(eName:"Beautiful",cName:"漂亮的",phonetic:"ˈbyo͞odəfəl",img:"beautiful.jpg"),
        Voca(eName:"Bedroom",cName:"臥室",phonetic:"ˈbedˌro͞om",img:"bedroom.jpg"),
        Voca(eName:"Beetle",cName:"甲蟲",phonetic:"ˈbēdl",img:"beetle.jpg"),
        Voca(eName:"Beverage",cName:"飲料",phonetic:"ˈbev(ə)rij",img:"beverage.jpg"),
        Voca(eName:"Binoculars",cName:"雙筒望遠鏡",phonetic:"bəˈnäkyələrz",img:"binoculars.jpg"),
        Voca(eName:"Biochemistry",cName:"化學",phonetic:"ˌbīōˈkeməstrē",img:"biochemistry.jpg"),
        Voca(eName:"Birthday",cName:"生日",phonetic:"ˈbərTHˌdā",img:"birthday.jpg"),
        Voca(eName:"Blaze",cName:"火焰",phonetic:"blāz",img:"blaze.jpg"),
        Voca(eName:"Bodyguard",cName:"保鏢",phonetic:"bädēˌɡärd",img:"bodyguard.jpg"),
        Voca(eName:"Boxer",cName:"拳擊手",phonetic:"ˈbäksər",img:"boxer.jpg"),
        Voca(eName:"Braid",cName:"辮子",phonetic:"brād",img:"braid.jpg"),
        Voca(eName:"Bride",cName:"新娘",phonetic:"brīd",img:"bride.jpg"),
        Voca(eName:"Bulb",cName:"燈泡",phonetic:"bəlb",img:"bulb.jpg"),
        Voca(eName:"Burglar",cName:"闖空門的人",phonetic:"ˈbərɡlər",img:"burglar.jpg"),
        Voca(eName:"Burial",cName:"墳墓",phonetic:"ˈberēəl",img:"burial.jpg"),
        Voca(eName:"Butcher",cName:"肉販",phonetic:"ˈbo͝oCHər",img:"butcher.jpg"),
        Voca(eName:"Butterfly",cName:"蝴蝶",phonetic:"ˋbʌtɚ͵flaɪ",img:"butterfly.jpg"),
        Voca(eName:"cabbage",cName:"大白菜",phonetic:"ˋkæbɪdʒ",img:"cabbage.jpg"),
        Voca(eName:"cabin",cName:"船艙",phonetic:"ˋkæbɪn",img:"cabin.jpg"),
        Voca(eName:"cactus",cName:"仙人掌",phonetic:"ˋkæktəs",img:"cactus.jpg"),
        Voca(eName:"cadaver",cName:"屍體",phonetic:"kəˋdævɚ",img:"cadaver.jpg"),
        Voca(eName:"cake",cName:"蛋糕",phonetic:"kek",img:"cake.jpg"),
        Voca(eName:"camp",cName:"營地",phonetic:"kæmp",img:"camp.jpg"),
        Voca(eName:"can",cName:"罐頭",phonetic:"kæn",img:"can.jpg"),
        Voca(eName:"candle",cName:"蠟燭",phonetic:"ˋkænd!",img:"candle.jpg"),
        Voca(eName:"candy",cName:"糖果",phonetic:"ˋkændɪ",img:"candy.jpg"),
        Voca(eName:"cane",cName:"手杖",phonetic:"ken",img:"cane.jpg"),
        Voca(eName:"canyon",cName:"峽谷",phonetic:"ˋkænjən",img:"canyon.jpg"),
        Voca(eName:"cap",cName:"帽子",phonetic:"kæp",img:"cap.jpg"),
        Voca(eName:"cape",cName:"斗篷",phonetic:"kep",img:"cape.jpg"),
        Voca(eName:"carrot",cName:"胡蘿蔔",phonetic:"ˋkærət",img:"carrot.jpg"),
        Voca(eName:"case",cName:"盒子",phonetic:"kes",img:"case.jpg"),
        Voca(eName:"cash",cName:"現金",phonetic:"kæʃ",img:"cash.jpg"),
        Voca(eName:"cask",cName:"木桶",phonetic:"kæsk",img:"cask.jpg"),
        Voca(eName:"cat",cName:"貓",phonetic:"kæt",img:"cat.jpg"),
        Voca(eName:"cattle",cName:"牛",phonetic:"ˋkæt!",img:"cattle.jpg"),
        Voca(eName:"cavalryman",cName:"騎兵",phonetic:"ˋkæv!rɪmən",img:"cavalryman.jpg"),
        Voca(eName:"cave",cName:"山洞",phonetic:"kev",img:"cave.jpg"),
        Voca(eName:"cayenne",cName:"辣椒",phonetic:"ˋkeɛn",img:"cayenne.jpg"),
        Voca(eName:"censer",cName:"香爐",phonetic:"ˋsɛnsɚ",img:"censer.jpg"),
        Voca(eName:"centipede",cName:"蜈蚣",phonetic:"ˋsɛntə͵pid",img:"centipede.jpg"),
        Voca(eName:"cerebrum",cName:"大腦",phonetic:"ˋsɛrəbrəm",img:"cerebrum.jpg"),
        Voca(eName:"champion",cName:"冠軍",phonetic:"ˋtʃæmpɪən",img:"champion.png"),
        Voca(eName:"charmer",cName:"巫師",phonetic:"ˋtʃɑrmɚ",img:"charmer.jpg"),
        Voca(eName:"chattel",cName:"奴隸",phonetic:"ˋtʃæt!",img:"chattel.jpg"),
        Voca(eName:"check",cName:"支票",phonetic:"tʃɛk",img:"check.jpg"),
        Voca(eName:"clothes",cName:"衣服",phonetic:"kloz",img:"clothes.jpg"),
        Voca(eName:"Dad",cName:"爸爸",phonetic:"dad",img:"Dad.jpg"),
        Voca(eName:"Dance",cName:"跳舞",phonetic:"dans",img:"Dance.jpg"),
        Voca(eName:"Danger",cName:"危險",phonetic:"ˈdānjər",img:"Danger.jpg"),
        Voca(eName:"Dark",cName:"黑暗的",phonetic:"därk",img:"Dark.jpg"),
        Voca(eName:"Daughter",cName:"女兒",phonetic:"ˈdôdər",img:"Daughter.jpg"),
        Voca(eName:"Day",cName:"一天",phonetic:"de",img:"Day.jpg"),
        Voca(eName:"Dead",cName:"死的",phonetic:"ded",img:"Dead.jpg"),
        Voca(eName:"Decline",cName:"婉拒",phonetic:"dəˈklīn",img:"Decline.jpg"),
        Voca(eName:"Decompose",cName:"分解",phonetic:"ˌdēkəmˈpōz",img:"Decompose.jpg"),
        Voca(eName:"Decrease",cName:"減少",phonetic:"dəˈkrēs",img:"Decrease.jpg"),
        Voca(eName:"Deep",cName:"深的",phonetic:"dēp",img:"Deep.jpg"),
        Voca(eName:"Deer",cName:"鹿",phonetic:"dir",img:"Deer.jpg"),
        Voca(eName:"Delete",cName:"刪除",phonetic:"dəˈlēt",img:"Delete.jpg"),
        Voca(eName:"Deliver",cName:"傳送",phonetic:"dəˈlivər",img:"Deliver.jpg"),
        Voca(eName:"Demand",cName:"要求",phonetic:"dəˈmand",img:"Demand.jpg"),
        Voca(eName:"Design",cName:"設計",phonetic:"dəˈzīn",img:"Design.jpg"),
        Voca(eName:"Diary",cName:"日記",phonetic:"ˈdī(ə)rē",img:"Diary.jpg"),
        Voca(eName:"Different",cName:"不同的",phonetic:"ˈdif(ə)rənt",img:"Different.jpg"),
        Voca(eName:"Director",cName:"導演",phonetic:"diˈrektər",img:"Director.jpg"),
        Voca(eName:"Discuss",cName:"討論",phonetic:"dəˈskəs",img:"Discuss.jpg"),
        Voca(eName:"Dish",cName:"盤子",phonetic:"diSH",img:"Dish.jpg"),
        Voca(eName:"Doctor",cName:"醫生",phonetic:"ˈdäktər",img:"Doctor.jpg"),
        Voca(eName:"Dog",cName:"狗",phonetic:"dôɡ",img:"Dog.jpg"),
        Voca(eName:"Double",cName:"兩倍的",phonetic:"ˈdəb(ə)l",img:"Double.jpg"),
        Voca(eName:"Doubt",cName:"懷疑",phonetic:"dout",img:"Doubt.jpg"),
        Voca(eName:"Down",cName:"下降",phonetic:"doun",img:"Down.jpg"),
        Voca(eName:"Draw",cName:"畫",phonetic:"drô",img:"Draw.jpg"),
        Voca(eName:"Dream",cName:"夢想",phonetic:"drēm",img:"Dream.jpg"),
        Voca(eName:"Dress",cName:"裙子",phonetic:"dres",img:"Dress.jpg"),
        Voca(eName:"Dry",cName:"乾的",phonetic:"drī",img:"Dry.jpg"),
        Voca(eName:"eagle",cName:"老鷹",phonetic:"ˋig!",img:"eagle.jpg"),
        Voca(eName:"ear",cName:"耳朵",phonetic:"ir",img:"ear.jpg"),
        Voca(eName:"eardrum",cName:"耳膜",phonetic:"ˋɪr͵drʌm",img:"eardrum.jpg"),
        Voca(eName:"earlobe",cName:"耳垂",phonetic:"ˋɪr͵lob",img:"earlobe.jpg"),
        Voca(eName:"earmuffs",cName:"耳罩",phonetic:"ˋɪr͵mʌf",img:"earmuffs.jpg"),
        Voca(eName:"earnings",cName:"薪水",phonetic:"ˋɝnɪŋz",img:"earnings.jpg"),
        Voca(eName:"earphone",cName:"耳機",phonetic:"ˋɪr͵fon",img:"earphone.jpg"),
        Voca(eName:"earpiece",cName:"電話聽筒",phonetic:"ɪr͵pis",img:"earpiece.jpg"),
        Voca(eName:"earplug",cName:"耳塞",phonetic:"ˋɪr͵plʌg",img:"earplug.jpg"),
        Voca(eName:"earth",cName:"地球",phonetic:"ərTH",img:"earth.jpg"),
        Voca(eName:"earthworm",cName:"蚯蚓",phonetic:"ˋɝθ͵wɝm",img:"earthworm.jpg"),
        Voca(eName:"eat",cName:"吃",phonetic:"ēt",img:"eat.jpg"),
        Voca(eName:"economy",cName:"經濟",phonetic:"əˈkänəmē",img:"economy.jpg"),
        Voca(eName:"eel",cName:"鰻魚",phonetic:"il",img:"eel.jpg"),
        Voca(eName:"eight",cName:"八",phonetic:"et",img:"eight.jpg"),
        Voca(eName:"elbow",cName:"手肘",phonetic:"ˋɛlbo",img:"elbow.jpg"),
        Voca(eName:"electronic",cName:"電子的",phonetic:"ɪlɛkˋtrɑnɪk",img:"electronic.jpg"),
        Voca(eName:"elementary",cName:"小學",phonetic:"eləˈment(ə)rē",img:"elementary.jpg"),
        Voca(eName:"e-mail",cName:"電子郵件",phonetic:"ˈēmā",img:"e-mail.jpg"),
        Voca(eName:"embassy",cName:"大使館",phonetic:"ˋɛmbəsɪ",img:"embassy.jpg"),
        Voca(eName:"emperor",cName:"皇帝",phonetic:"ˋɛmpərɚ",img:"emperor.jpg"),
        Voca(eName:"encyclopedia",cName:"百科全書",phonetic:"ɪn͵saɪkləˋpidɪə",img:"encyclopedia.jpg"),
        Voca(eName:"engineer",cName:"工程師",phonetic:"ˌenjəˈnir",img:"engineer.jpg"),
        Voca(eName:"envelope",cName:"信封",phonetic:"ənˈveləp",img:"envelope.jpg"),
        Voca(eName:"equalize",cName:"均衡",phonetic:"ˋikwəl͵aɪz",img:"equalize.jpg"),
        Voca(eName:"eraser",cName:"橡皮擦",phonetic:"ɪˋresɚ",img:"eraser.jpg"),
        Voca(eName:"europe",cName:"歐洲",phonetic:"ˋjʊrəp",img:"europe.jpg"),
        Voca(eName:"exciting",cName:"興奮",phonetic:"ikˈsīdiNG",img:"exciting.jpg"),
        Voca(eName:"eye",cName:"眼睛",phonetic:"ī",img:"eye.jpg"),
        Voca(eName:"eyelid",cName:"眼皮",phonetic:"ˋaɪ͵lɪd",img:"eyelid.jpg"),
        Voca(eName:"face",cName:"臉",phonetic:"fes",img:"face.png"),
        Voca(eName:"factory",cName:"工廠",phonetic:"ˋfæməlɪ",img:"factory.jpg"),
        Voca(eName:"family",cName:"家庭",phonetic:"fæn",img:"family.png"),
        Voca(eName:"fan",cName:"扇子",phonetic:"fɑr",img:"fan.png"),
        Voca(eName:"far",cName:"遠的",phonetic:"fɑrm",img:"far.png"),
        Voca(eName:"farm",cName:"農場",phonetic:"ˋfɑrmɚ",img:"farm.png"),
        Voca(eName:"farmer",cName:"農夫",phonetic:"fæst",img:"farmer.png"),
        Voca(eName:"fast",cName:"快的",phonetic:"fæt",img:"fast.png"),
        Voca(eName:"fat",cName:"胖的",phonetic:"ˋfɑðɚ",img:"fat.png"),
        Voca(eName:"father",cName:"父親",phonetic:"ˋfæktərɪ",img:"father.png"),
        Voca(eName:"fifteen",cName:"十五",phonetic:"ˋfɪfˋtin",img:"fifteen.jpg"),
        Voca(eName:"fight",cName:"戰鬥",phonetic:"faɪt",img:"fight.jpg"),
        Voca(eName:"fireplace",cName:"壁爐",phonetic:"ˋfaɪr͵ples",img:"fireplace.jpg"),
        Voca(eName:"firework",cName:"煙火",phonetic:"ˋfaɪr͵wɝk",img:"firework.jpg"),
        Voca(eName:"flame",cName:"火焰",phonetic:"flem",img:"flame.jpg"),
        Voca(eName:"flea",cName:"跳蚤",phonetic:"fli",img:"flea.jpg"),
        Voca(eName:"flood",cName:"水災",phonetic:"flʌd",img:"flood.jpg"),
        Voca(eName:"flower",cName:"花",phonetic:"ˋflaʊɚ",img:"flower.jpg"),
        Voca(eName:"flute",cName:"橫笛",phonetic:"flut",img:"flute.jpg"),
        Voca(eName:"fly",cName:"蒼蠅",phonetic:"flaɪ",img:"fly.jpg"),
        Voca(eName:"fod",cName:"食物",phonetic:"fud",img:"food.jpg"),
        Voca(eName:"foot",cName:"腳",phonetic:"fʊt",img:"foot.jpg"),
        Voca(eName:"forge",cName:"冶煉場",phonetic:"fɔrdʒ",img:"forge.jpg"),
        Voca(eName:"fork",cName:"叉子",phonetic:"fɔrk",img:"fork.jpg"),
        Voca(eName:"fort",cName:"堡壘",phonetic:"fort",img:"fort.jpg"),
        Voca(eName:"fossil",cName:"化石",phonetic:"ˋfɑs",img:"fossil.jpg"),
        Voca(eName:"fox",cName:"狐狸",phonetic:"fɑks",img:"fox.jpg"),
        Voca(eName:"frog",cName:"青蛙",phonetic:"frɑg",img:"frog.jpg"),
        Voca(eName:"funeral",cName:"葬禮",phonetic:"ˋfjunərəl",img:"funeral.jpg"),
        Voca(eName:"funny",cName:"好笑的",phonetic:"ˋfʌnɪ",img:"funny.jpg"),
        Voca(eName:"gambler",cName:"賭徒",phonetic:"ˋgæmb!ɚ",img:"gambler.jpg"),
        Voca(eName:"game",cName:"遊戲",phonetic:"gem",img:"game.jpg"),
        Voca(eName:"gangster",cName:"匪徒",phonetic:"ˋgæŋstɚ",img:"gangster.jpg"),
        Voca(eName:"gaol",cName:"監獄",phonetic:"ˋdʒel",img:"gaol.jpg"),
        Voca(eName:"gap",cName:"缺口",phonetic:"gæp",img:"gap.jpg"),
        Voca(eName:"garbage",cName:"垃圾",phonetic:"ˋgɑrbɪdʒ",img:"garbage.jpg"),
        Voca(eName:"garden",cName:"花園",phonetic:"ˋgɑrdn",img:"garden.jpg"),
        Voca(eName:"gardener",cName:"園丁",phonetic:"ˋgɑrdənɚ",img:"gardener.jpg"),
        Voca(eName:"garlic",cName:"大蒜",phonetic:"ˋgɑrlɪk",img:"garlic.jpg"),
        Voca(eName:"garnet",cName:"石榴石",phonetic:"ˋgɑrnɪt",img:"garnet.jpg"),
        Voca(eName:"gasoline",cName:"汽油",phonetic:"ˋgæsə͵lin",img:"gasoline.jpg"),
        Voca(eName:"gate",cName:"大門",phonetic:"get",img:"gate.jpg"),
        Voca(eName:"gauze",cName:"薄紗",phonetic:"gɔz",img:"gauze.jpg"),
        Voca(eName:"gaze",cName:"注視",phonetic:"gez",img:"gaze.jpg"),
        Voca(eName:"gender",cName:"性別",phonetic:"ˋdʒɛndɚ",img:"gender.jpg"),
        Voca(eName:"germ",cName:"細菌",phonetic:"dʒɝm",img:"germ.jpg"),
        Voca(eName:"ghost",cName:"鬼魂",phonetic:"gost",img:"ghost.png"),
        Voca(eName:"giant",cName:"巨人",phonetic:"ˋdʒaɪənt",img:"giant.jpg"),
        Voca(eName:"gift",cName:"禮物",phonetic:"gɪft",img:"gift.jpg"),
        Voca(eName:"ginger",cName:"生薑",phonetic:"ˋdʒɪndʒɚ",img:"ginger.jpg"),
        Voca(eName:"girl",cName:"女孩",phonetic:"gɝl",img:"girl.jpg"),
        Voca(eName:"glass",cName:"玻璃",phonetic:"glæs",img:"glass.jpg"),
        Voca(eName:"glen",cName:"峽谷",phonetic:"glɛn",img:"glen.jpg"),
        Voca(eName:"global",cName:"球狀的",phonetic:"ˋglob!",img:"global.jpg"),
        Voca(eName:"glove",cName:"手套",phonetic:"glʌv",img:"glove.jpg"),
        Voca(eName:"goat",cName:"山羊",phonetic:"got",img:"goat.jpg"),
        Voca(eName:"god",cName:"上帝",phonetic:"gɑd",img:"god.jpg"),
        Voca(eName:"goods",cName:"商品",phonetic:"gʊdz",img:"goods.jpg"),
        Voca(eName:"goose",cName:"鵝",phonetic:"gus",img:"goose.jpg"),
        Voca(eName:"gorilla",cName:"大猩猩",phonetic:"gəˋrɪlə",img:"gorilla.jpg"),
        Voca(eName:"hack",cName:"老馬",phonetic:"hak",img:"hack.jpg"),
        Voca(eName:"hamburger",cName:"漢堡",phonetic:"ˈhamˌbərgər",img:"hamburger.jpg"),
        Voca(eName:"hammer",cName:"榔頭",phonetic:"hamər",img:"hammer.jpg"),
        Voca(eName:"hand",cName:"手",phonetic:"hand",img:"hand.jpg"),
        Voca(eName:"handle",cName:"處理",phonetic:"ˈhandl",img:"handle.jpg"),
        Voca(eName:"handsome",cName:"英俊的",phonetic:"ˈhansəm",img:"handsome.jpg"),
        Voca(eName:"hang",cName:"把...掛起",phonetic:"han",img:"hang.jpg"),
        Voca(eName:"happy",cName:"快樂",phonetic:"ˈhapē",img:"happy.jpg"),
        Voca(eName:"hard",cName:"難",phonetic:"hard",img:"hard.jpg"),
        Voca(eName:"hat",cName:"帽子",phonetic:"hat",img:"hat.jpg"),
        Voca(eName:"hate",cName:"討厭",phonetic:"hāt",img:"hate.jpg"),
        Voca(eName:"hen",cName:"母雞",phonetic:"hen]",img:"hen.jpg"),
        Voca(eName:"hide",cName:"隱藏",phonetic:"hīd",img:"hide.jpg"),
        Voca(eName:"highlight",cName:"使顯著",phonetic:"ˈhīlīt",img:"highlight.jpg"),
        Voca(eName:"hit",cName:"打",phonetic:"hit",img:"hit.jpg"),
        Voca(eName:"hold",cName:"握著",phonetic:"hold",img:"hold.jpg"),
        Voca(eName:"honor",cName:"榮譽",phonetic:"ˈänər",img:"honor.jpg"),
        Voca(eName:"hook",cName:"掛鉤",phonetic:"ho͝ok",img:"hook.jpg"),
        Voca(eName:"hooker",cName:"妓女",phonetic:"ho͝okər",img:"hooker.jpg"),
        Voca(eName:"hooligan",cName:"小流氓",phonetic:"ˈho͞oləgin",img:"hooligan.jpg"),
        Voca(eName:"hope",cName:"希望",phonetic:"hōp",img:"hope.jpg"),
        Voca(eName:"horse",cName:"馬",phonetic:"hôrs",img:"horse.jpg"),
        Voca(eName:"hospital",cName:"醫院",phonetic:"ˈhäˌspitl",img:"hospital.jpg"),
        Voca(eName:"host",cName:"主人",phonetic:"host",img:"host.jpg"),
        Voca(eName:"hot",cName:"熱",phonetic:"hät",img:"hot.jpg"),
        Voca(eName:"hotel",cName:"旅館",phonetic:"hōˈtel",img:"hotel.jpg"),
        Voca(eName:"house ",cName:"房子",phonetic:"hous",img:"house.jpg"),
        Voca(eName:"humble",cName:"謙虛",phonetic:"ˈhəmbəl",img:"humble.jpg"),
        Voca(eName:"ice",cName:"冰",phonetic:"īs",img:"ice.jpg"),
        Voca(eName:"ice cream ",cName:"冰淇淋",phonetic:"ˌaɪs ˈkrim",img:"ice cream.jpg"),
        Voca(eName:"icon",cName:"圖標",phonetic:"īˌkän",img:"icon.png"),
        Voca(eName:"idea",cName:"想法",phonetic:"īdz",img:"idea.jpg"),
        Voca(eName:"ideal",cName:"理想;志向",phonetic:"īˈdē(ə)l",img:"ideal.png"),
        Voca(eName:"ident",cName:"識別",phonetic:"ˈīdent",img:"ident.jpg"),
        Voca(eName:"idol",cName:"偶像",phonetic:"ˈīdl",img:"idol.jpg"),
        Voca(eName:"illegal",cName:"非法的",phonetic:"i(l)ˈlēɡəl",img:"illegal.jpg"),
        Voca(eName:"illness",cName:"疾病",phonetic:"ˈilnəs",img:"illness.jpg"),
        Voca(eName:"important",cName:"重要的",phonetic:"imˈpôrtnt",img:"important.jpg"),
        Voca(eName:"incident",cName:"事件",phonetic:"ˈinsəd(ə)nt",img:"incident.png"),
        Voca(eName:"income",cName:"收入",phonetic:"ˈinˌkəm",img:"income.jpg"),
        Voca(eName:"increase",cName:"增加",phonetic:"inˈkrēs",img:"increase.jpg"),
        Voca(eName:"independent",cName:"獨立的",phonetic:"ˌindəˈpendənt",img:"independent.jpg"),
        Voca(eName:"indicate",cName:"指示",phonetic:"ˈindəˌkāt",img:"indicate.jpg"),
        Voca(eName:"industry",cName:"工業;行業",phonetic:"ˈindəstrē",img:"industry.jpg"),
        Voca(eName:"information",cName:"資訊;訊息",phonetic:"ˌinfərˈmāSH(ə)n",img:"information.jpg"),
        Voca(eName:"injure",cName:"傷害",phonetic:"ˈinjər",img:"injure.jpg"),
        Voca(eName:"insect",cName:"昆蟲",phonetic:"ˈinˌsekt",img:"insect.jpg"),
        Voca(eName:"intelligence",cName:"智力",phonetic:"inˈteləjəns",img:"intelligence.jpg"),
        Voca(eName:"international",cName:"國際的",phonetic:"ˌin(t)ərˈnaSH(ə)n(ə)l",img:"international.jpg"),
        Voca(eName:"internet",cName:"網際網路",phonetic:"ˈin(t)ərˌnet",img:"internet.jpg"),
        Voca(eName:"invade",cName:"入侵",phonetic:"inˈvād",img:"invade.jpg"),
        Voca(eName:"invent",cName:"發明",phonetic:"inˈvent",img:"invent.jpg"),
        Voca(eName:"invest",cName:"投資",phonetic:"inˈvest",img:"invest.jpg"),
        Voca(eName:"investigate",cName:"調查",phonetic:"inˈvestəˌɡāt",img:"investigate.jpg"),
        Voca(eName:"invite",cName:"邀請",phonetic:"inˈvīt",img:"invite.png"),
        Voca(eName:"iron",cName:"鐵",phonetic:"ī(ə)rn",img:"iron.jpg"),
        Voca(eName:"island",cName:"島嶼",phonetic:"ˈīlənd",img:"island.jpg"),
        Voca(eName:"issue",cName:"議題",phonetic:"ˈiSHo͞o",img:"issue.jpg"),
        Voca(eName:"jacal",cName:"小茅屋",phonetic:"hɑˋkɑl",img:"jacal.jpg"),
        Voca(eName:"jacana",cName:"水雉",phonetic:"͵ʒɑsəˋnɑ",img:"jacana.jpg"),
        Voca(eName:"jackal",cName:"豺狼",phonetic:"ˋdʒækɔl",img:"jackal.jpg"),
        Voca(eName:"jackboot",cName:"長筒靴",phonetic:"ˋdʒæk͵but",img:"jackboot.jpg"),
        Voca(eName:"jacket",cName:"夾克",phonetic:"ˋdʒækIt",img:"jacket.jpg"),
        Voca(eName:"jackfruit",cName:"菠蘿蜜",phonetic:"ˋdʒæk͵frut",img:"jackfruit.jpg"),
        Voca(eName:"jackknife",cName:"摺疊刀",phonetic:"ˋdʒæk͵naɪf",img:"jackknife.jpg"),
        Voca(eName:"jackshaft",cName:"起重機",phonetic:"ˋdʒæk͵ʃæft",img:"jackshaft.jpg"),
        Voca(eName:"jail",cName:"監獄",phonetic:"dʒel",img:"jail.jpg"),
        Voca(eName:"jam",cName:"果醬",phonetic:"dʒæm",img:"jam.jpg"),
        Voca(eName:"jamb",cName:"門邊框柱",phonetic:"dʒæm",img:"jamb.jpg"),
        Voca(eName:"jazz",cName:"爵士樂",phonetic:"dʒæz",img:"jazz.jpg"),
        Voca(eName:"jeans",cName:"牛仔褲",phonetic:"dʒinz",img:"jeans.jpg"),
        Voca(eName:"jelly",cName:"果凍",phonetic:"ˋdʒɛlɪ",img:"jelly.jpg"),
        Voca(eName:"jet",cName:"噴射機",phonetic:"dʒZt",img:"jet.jpg"),
        Voca(eName:"jewelry",cName:"珠寶",phonetic:"ˋdʒuәlrI",img:"jewelry.jpg"),
        Voca(eName:"job",cName:"工作",phonetic:"dʒɑb",img:"job.jpg"),
        Voca(eName:"jog",cName:"慢跑",phonetic:"dʒɑg",img:"jog.jpg"),
        Voca(eName:"joke",cName:"笑話",phonetic:"dʒok",img:"joke.jpg"),
        Voca(eName:"journal",cName:"日誌",phonetic:"ˋdʒFnL",img:"journal.jpg"),
        Voca(eName:"journey",cName:"旅行",phonetic:"ˋdʒFnI",img:"journey.jpg"),
        Voca(eName:"joy",cName:"歡樂",phonetic:"dʒɔɪ",img:"joy.jpg"),
        Voca(eName:"judge",cName:"法官",phonetic:"dʒʌdʒ",img:"judge.jpg"),
        Voca(eName:"jug",cName:"水壺",phonetic:"dʒʌg",img:"jug.jpg"),
        Voca(eName:"juice",cName:"果汁",phonetic:"dʒus",img:"juice.jpg"),
        Voca(eName:"jump",cName:"跳",phonetic:"dʒʌmp",img:"jump.jpg"),
        Voca(eName:"jungle",cName:"叢林",phonetic:"ˋdʒʌŋgL",img:"jungle.jpg"),
        Voca(eName:"junk",cName:"垃圾",phonetic:"dʒʌŋk",img:"junk.jpg"),
        Voca(eName:"jury",cName:"陪審團",phonetic:"ˈdʒʊrɪ",img:"jury.jpg"),
        Voca(eName:"justice",cName:"公平",phonetic:"ˋdʒʌstIs",img:"justice.jpg"),
        Voca(eName:"Kaiser",cName:"皇帝",phonetic:"ˋkaɪzɚ",img:"Kaiser.jpg"),
        Voca(eName:"kaleidoscope",cName:"萬花筒",phonetic:"kəˋlaɪdə͵skop",img:"kaleidoscope.jpg"),
        Voca(eName:"kangaroo",cName:"袋鼠",phonetic:"͵kæŋgəˋru",img:"kangaroo.jpg"),
        Voca(eName:"karate",cName:"空手道",phonetic:"kəˋrɑtɪ",img:"karate.jpg"),
        Voca(eName:"keel",cName:"平底船",phonetic:"kil",img:"keel.jpg"),
        Voca(eName:"kennel",cName:"狗窩",phonetic:"ˋkɛn!",img:"kennel.jpg"),
        Voca(eName:"kerchief",cName:"手帕",phonetic:"ˋkɝtʃɪf",img:"kerchief.jpg"),
        Voca(eName:"kettle",cName:"水壺",phonetic:"ˋkɛt!",img:"kettle.jpg"),
        Voca(eName:"key",cName:"鑰匙",phonetic:"ki",img:"key.png"),
        Voca(eName:"keyboard",cName:"鍵盤",phonetic:"ˋki͵bord",img:"keyboard.jpg"),
        Voca(eName:"keypad",cName:"小鍵盤",phonetic:"ˋki͵pæd",img:"keypad.jpg"),
        Voca(eName:"kid",cName:"少年",phonetic:"kɪd",img:"kid.jpg"),
        Voca(eName:"kill",cName:"殺",phonetic:"kɪl",img:"kill.jpg"),
        Voca(eName:"killer",cName:"殺手",phonetic:"ˋkɪlɚ",img:"killer.jpg"),
        Voca(eName:"kindergarten",cName:"幼稚園",phonetic:"ˋkɪndɚ͵gɑrtn",img:"kindergarten.jpg"),
        Voca(eName:"king",cName:"國王",phonetic:"kɪŋ",img:"king.png"),
        Voca(eName:"kip",cName:"旅店",phonetic:"kɪp",img:"kip.jpg"),
        Voca(eName:"kiss",cName:"吻",phonetic:"kɪs",img:"kiss.jpg"),
        Voca(eName:"kitchen",cName:"廚房",phonetic:"ˋkɪtʃɪn",img:"kitchen.jpg"),
        Voca(eName:"kite",cName:"風箏",phonetic:"kaɪt",img:"kite.jpg"),
        Voca(eName:"kitten",cName:"小貓",phonetic:"ˋkɪtn",img:"kitten.jpg"),
        Voca(eName:"knead",cName:"揉",phonetic:"nid",img:"knead.jpg"),
        Voca(eName:"knee",cName:"膝蓋",phonetic:"ni",img:"knee.jpg"),
        Voca(eName:"kneel",cName:"跪下",phonetic:"nil",img:"kneel.png"),
        Voca(eName:"knife",cName:"刀子",phonetic:"naɪf",img:"knife.jpg"),
        Voca(eName:"knight",cName:"騎士",phonetic:"naɪt",img:"knight.jpg"),
        Voca(eName:"knob",cName:"門把",phonetic:"nɑb",img:"knob.jpg"),
        Voca(eName:"knock",cName:"敲",phonetic:"nɑk",img:"knock.jpg"),
        Voca(eName:"knot",cName:"繩結",phonetic:"nɑt",img:"knot.jpg"),
        Voca(eName:"ksyak",cName:"獨木舟",phonetic:"ˈkaɪæk",img:"ksyak.jpg"),
        Voca(eName:"lace",cName:"緞帶",phonetic:"lās",img:"lacep.jpg"),
        Voca(eName:"lack",cName:"缺乏",phonetic:"lak",img:"lackp.jpg"),
        Voca(eName:"lackadaisical",cName:"不客氣",phonetic:"ˌlakəˈdāzək(ə)l",img:"lackadaisicalp.png"),
        Voca(eName:"lacrimal",cName:"眼淚",phonetic:"ˈlakrəməl",img:"lacrimalp.png"),
        Voca(eName:"lactic",cName:"乳酸",phonetic:"ˈlaktik",img:"lacticp.jpg"),
        Voca(eName:"lacuna",cName:"空白",phonetic:"ləˈk(y)o͞onə",img:"lacunap.png"),
        Voca(eName:"laden",cName:"負擔",phonetic:"lādn",img:"ladenp.png"),
        Voca(eName:"lady",cName:"女士",phonetic:"ˈlādē",img:"ladyp.jpg"),
        Voca(eName:"laic",cName:"凡人",phonetic:"ˈlāik",img:"laicp.png"),
        Voca(eName:"lake",cName:"湖",phonetic:"lāk",img:"lakep.jpg"),
        Voca(eName:"lamb",cName:"羔羊",phonetic:"lam",img:"lambp.jpg"),
        Voca(eName:"lamp",cName:"檯燈",phonetic:"lamp",img:"lampp.jpg"),
        Voca(eName:"land",cName:"陸地",phonetic:"land",img:"landp.jpg"),
        Voca(eName:"language",cName:"語言",phonetic:"ˈlaNGɡwij",img:"languagep.png"),
        Voca(eName:"laugh",cName:"笑",phonetic:"laf",img:"laughp.png"),
        Voca(eName:"lawyer",cName:"律師",phonetic:"ˈloiər",img:"lawyerp.jpg"),
        Voca(eName:"lazy",cName:"懶惰",phonetic:"ˈlāzē",img:"lazyp.png"),
        Voca(eName:"leave",cName:"離開",phonetic:"lēv",img:"leavep.jpg"),
        Voca(eName:"leg",cName:"腳",phonetic:"leɡ",img:"legp.png"),
        Voca(eName:"lemon",cName:"檸檬",phonetic:"ˈlemən",img:"lemonp.jpg"),
        Voca(eName:"lesson",cName:"課堂",phonetic:"ˈles(ə)n",img:"lessonp.png"),
        Voca(eName:"lettuce",cName:"萵苣",phonetic:"ˈledəs",img:"lettucep.jpg"),
        Voca(eName:"lid",cName:"蓋子",phonetic:"lid",img:"lidp.jpg"),
        Voca(eName:"lie",cName:"謊言",phonetic:"lī",img:"liep.jpg"),
        Voca(eName:"life",cName:"生命",phonetic:"līf",img:"lifep.jpg"),
        Voca(eName:"limit",cName:"極限",phonetic:"ˈlimit",img:"limitp.png"),
        Voca(eName:"location",cName:"位置",phonetic:"lōˈkāSH(ə)n",img:"locationp.png"),
        Voca(eName:"lolly",cName:"棒棒糖",phonetic:"ˈlälē",img:"lollyp.png"),
        Voca(eName:"lose",cName:"喪失",phonetic:"lo͞oz",img:"losep.jpg"),
        Voca(eName:"lucky",cName:"幸運",phonetic:"ˈləkē",img:"luckyp.jpg"),
        Voca(eName:"macadam",cName:"碎石路",phonetic:"məˋkædəm",img:"macadam.jpg"),
        Voca(eName:"macaron",cName:"蛋白杏仁餅乾",phonetic:"͵mækəˋrun",img:"macaroon.jpg"),
        Voca(eName:"macaroni",cName:"通心麵",phonetic:"͵mækəˋronɪ",img:"macaroni.jpg"),
        Voca(eName:"mace",cName:"權杖",phonetic:"mes",img:"mace.jpg"),
        Voca(eName:"machete",cName:"大砍刀",phonetic:"mɑˋtʃete",img:"machete.jpg"),
        Voca(eName:"mackerel",cName:"鯖魚",phonetic:"ˋmækərəl",img:"mackerel.jpg"),
        Voca(eName:"mackintosh",cName:"風衣",phonetic:"ˈmækɪntɒʃ",img:"mackintosh.jpg"),
        Voca(eName:"Madonna",cName:"聖母瑪利亞",phonetic:"məˋdɑnə",img:"Madonna.jpg"),
        Voca(eName:"maelstorm",cName:"混亂",phonetic:"ˈmeɪlstrəm",img:"maelstorm.jpg"),
        Voca(eName:"magazine",cName:"雜誌",phonetic:"͵mægəˋzin",img:"magazine.jpg"),
        Voca(eName:"magic",cName:"魔法",phonetic:"ˋmædʒɪk",img:"magic.jpg"),
        Voca(eName:"magnifier",cName:"放大鏡",phonetic:"ˋmægnə͵faɪɚ",img:"magnifier.png"),
        Voca(eName:"mail",cName:"郵件",phonetic:"mel",img:"mail.png"),
        Voca(eName:"mailbox",cName:"郵筒",phonetic:"ˋmel͵bɑks",img:"mailbox.jpg"),
        Voca(eName:"mailman",cName:"郵差",phonetic:"ˋmel͵mæn",img:"mailman.jpg"),
        Voca(eName:"mainmast",cName:"主桅",phonetic:"ˋmen͵mæst",img:"mainmast.jpg"),
        Voca(eName:"maize",cName:"玉蜀黍",phonetic:"mez",img:"maize.jpg"),
        Voca(eName:"male",cName:"男子",phonetic:"mel",img:"male.png"),
        Voca(eName:"malefactor",cName:"罪人",phonetic:"ˋmælə͵fæktɚ",img:"malefactor.jpg"),
        Voca(eName:"malt",cName:"啤酒",phonetic:"mɔlt",img:"malt.jpg"),
        Voca(eName:"mango",cName:"芒果",phonetic:"ˋmæŋgo",img:"mango.jpg"),
        Voca(eName:"manor",cName:"莊園",phonetic:"ˋmænɚ",img:"manor.jpg"),
        Voca(eName:"manservant",cName:"女僕",phonetic:"ˋmæn͵sɝvənt",img:"manservant.png"),
        Voca(eName:"manure",cName:"肥料",phonetic:"məˋnjʊr",img:"manure.jpg"),
        Voca(eName:"maple",cName:"楓樹",phonetic:"ˋmep!",img:"maple.jpg"),
        Voca(eName:"marble",cName:"大理石",phonetic:"ˋmɑrb!",img:"marble.jpg"),
        Voca(eName:"mariner",cName:"水手",phonetic:"ˋmærənɚ",img:"mariner.png"),
        Voca(eName:"marionette",cName:"牽線木偶",phonetic:"͵mærɪəˋnɛt",img:"marionette.jpg"),
        Voca(eName:"marish",cName:"沼澤",phonetic:"ˋmærɪʃ",img:"marish.jpg"),
        Voca(eName:"mom",cName:"母親",phonetic:"mɑm",img:"mom.jpg"),
        Voca(eName:"narrow",cName:"狹隘的;狹窄的",phonetic:"ˋnæro",img:"narrow.jpg"),
        Voca(eName:"nearsighted",cName:"近視的",phonetic:"ˋnɪrˋsaɪtɪd",img:"nearsighted.jpg"),
        Voca(eName:"neat",cName:"整潔的",phonetic:"nit",img:"neat.jpg"),
        Voca(eName:"necessary",cName:"必要的",phonetic:"ˋnɛsə͵sɛrɪ,",img:"necessary.png"),
        Voca(eName:"needy",cName:"貧窮的",phonetic:"ˋnidɪ",img:"needy.jpg"),
        Voca(eName:"neglect",cName:"忽視",phonetic:"nɪgˋlɛkt",img:"neglect.jpg"),
        Voca(eName:"negligence",cName:"粗心",phonetic:"ˋnɛglɪdʒəns",img:"negligence.jpg"),
        Voca(eName:"negligible",cName:"微不足道的",phonetic:"ˋnɛglɪdʒəb!",img:"negligible.png"),
        Voca(eName:"negotiable",cName:"可協商的",phonetic:"nɪˋgoʃɪəb!",img:"negotiable.jpg"),
        Voca(eName:"neighborly",cName:"親切的",phonetic:"ˋnebɚlɪ",img:"neighborly.jpg"),
        Voca(eName:"nephew",cName:"姪兒",phonetic:"ˋnɛfju",img:"nephew.jpg"),
        Voca(eName:"nerve",cName:"神經",phonetic:"nɝv",img:"nerve.jpg"),
        Voca(eName:"nevertheless",cName:"仍然",phonetic:"͵nɛvɚðəˋlɛs",img:"nevertheless.png"),
        Voca(eName:"newlywed",cName:"新結婚的人",phonetic:"ˋnjulɪ͵wɛd",img:"newlywed.jpg"),
        Voca(eName:"nickel",cName:"鎳",phonetic:"ˋnɪk!",img:"nickel.jpg"),
        Voca(eName:"nifty",cName:"俏皮的",phonetic:"ˋnɪftɪ",img:"nifty.jpg"),
        Voca(eName:"nimble",cName:"靈活的",phonetic:"ˋnɪmb!",img:"nimble.jpg"),
        Voca(eName:"nine",cName:"九",phonetic:"naɪn",img:"nine.jpg"),
        Voca(eName:"nitrogen",cName:"氮",phonetic:"ˋnaɪtrədʒən",img:"nitrogen.png"),
        Voca(eName:"noble",cName:"高貴的",phonetic:"ˋnob!",img:"noble.png"),
        Voca(eName:"nocturne",cName:"夜曲",phonetic:"ˋnɑktɝn",img:"nocturne.jpg"),
        Voca(eName:"nominal",cName:"名義上的",phonetic:"ˋnɑmən!",img:"nominal.jpg"),
        Voca(eName:"nominate",cName:"題名",phonetic:"ˋnɑmə͵net",img:"nominate.jpg"),
        Voca(eName:"notable",cName:"顯著的",phonetic:"ˋnotəb!",img:"notable.jpg"),
        Voca(eName:"notorious",cName:"惡名昭彰的",phonetic:"noˋtorɪəs",img:"notorious.png"),
        Voca(eName:"novelty",cName:"新穎",phonetic:"ˋnɑv!tɪ",img:"novelty.jpg"),
        Voca(eName:"nucleus",cName:"（原子）核",phonetic:"ˋnjuklɪəs",img:"nucleus.jpg"),
        Voca(eName:"nuisance",cName:"麻煩事",phonetic:"ˋnjusns",img:"nuisance.jpg"),
        Voca(eName:"nursery",cName:"幼兒室",phonetic:"ˋnɝsərɪ",img:"nursery.jpg"),
        Voca(eName:"nutritionist",cName:"營養學家",phonetic:"njuˋtrɪʃənɪst",img:"nutritionist.jpg"),
        Voca(eName:"oak",cName:"橡樹",phonetic:"oʊk",img:"oak.jpg"),
        Voca(eName:"oar",cName:"槳",phonetic:"ɔr, or",img:"oar.jpg"),
        Voca(eName:"oasis",cName:"綠洲",phonetic:"oʊˈeɪsɪs",img:"oasis.jpg"),
        Voca(eName:"oath",cName:"宣誓",phonetic:"oʊθ",img:"oath.jpg"),
        Voca(eName:"obey",cName:"服從",phonetic:"oˈbe",img:"obey.jpg"),
        Voca(eName:"obituary",cName:"死亡公告",phonetic:"oʊˈbɪtʃueri",img:"obituary.jpg"),
        Voca(eName:"object",cName:"物件",phonetic:"ˈɑbdʒekt",img:"object.jpg"),
        Voca(eName:"obscure",cName:"不清楚的",phonetic:"əbˈskjʊr",img:"obscure.jpg"),
        Voca(eName:"observatory",cName:"觀測所",phonetic:"əbˈzɜrvətɔri",img:"observatory.jpg"),
        Voca(eName:"obstacle",cName:"障礙物",phonetic:"ˈɑbstəkl",img:"obstacle.jpg"),
        Voca(eName:"octopus",cName:"章魚",phonetic:"ˈɑktəpəs]",img:"octopus.jpg"),
        Voca(eName:"office",cName:"辦公室",phonetic:"ˈɔfɪs",img:"office.jpg"),
        Voca(eName:"officer",cName:"軍官,官吏,警官,警察",phonetic:"ˈɔfɪsə(r)",img:"officer.jpg"),
        Voca(eName:"onion",cName:"洋蔥",phonetic:"ˈʌnjən",img:"onion.jpg"),
        Voca(eName:"op",cName:"開刀手術",phonetic:"ɑp",img:"op.jpg"),
        Voca(eName:"opener",cName:"開瓶器,開罐器",phonetic:"ˈəʊpnə(r)",img:"opener.jpg"),
        Voca(eName:"opera",cName:"歌劇",phonetic:"ˈɑprə",img:"opera.jpg"),
        Voca(eName:"oppose",cName:"反對",phonetic:"əˈpoʊz",img:"oppose.jpg"),
        Voca(eName:"orchestra",cName:"管弦樂隊",phonetic:"ˈɔ:kɪstrə",img:"orchestra.jpg"),
        Voca(eName:"ore",cName:"礦石",phonetic:"ɔr",img:"ore.jpg"),
        Voca(eName:"organ",cName:"器官,風琴",phonetic:"ˈɔ:gən",img:"organ.jpg"),
        Voca(eName:"oscillator",cName:"震盪器",phonetic:"ˈɒsɪleɪtə(r)",img:"oscillator.jpg"),
        Voca(eName:"ostrich",cName:"鴕鳥",phonetic:"ˈɒstrɪtʃ",img:"ostrich.jpg"),
        Voca(eName:"outbreak",cName:"暴動",phonetic:"ˈaʊtbreɪk",img:"outbreak.jpg"),
        Voca(eName:"outskirts",cName:"郊區",phonetic:"ˈaʊtskɜ:ts",img:"outskirts.jpg"),
        Voca(eName:"oven",cName:"烤箱",phonetic:"ˈʌvn",img:"oven.jpg"),
        Voca(eName:"overlook",cName:"俯視",phonetic:"ˌəʊvəˈlʊk",img:"overlook.jpg"),
        Voca(eName:"overpass",cName:"天橋",phonetic:"ˈəʊvəpɑ:s",img:"overpass.jpg"),
        Voca(eName:"owl",cName:"貓頭鷹",phonetic:"aʊl",img:"owl.jpg"),
        Voca(eName:"ox",cName:"公牛",phonetic:"ɒks",img:"ox.jpg"),
        Voca(eName:"packman",cName:"小販",phonetic:"ˋpækmən",img:"packman.jpg"),
        Voca(eName:"paction",cName:"契約書",phonetic:"ˋpækʃən",img:"paction.jpg"),
        Voca(eName:"padre",cName:"神父",phonetic:"ˋpɑdrɪ",img:"padre.jpg"),
        Voca(eName:"palace",cName:"宮殿",phonetic:"ˋpælɪs",img:"palace.jpg"),
        Voca(eName:"pamphlet",cName:"小冊子",phonetic:"ˋpæmflɪt",img:"pamphlet.jpg"),
        Voca(eName:"pan",cName:"平底鍋",phonetic:"pæn",img:"pan.jpg"),
        Voca(eName:"pancake",cName:"鬆餅",phonetic:"ˋpæn͵kek",img:"pancake.jpg"),
        Voca(eName:"panda",cName:"貓熊",phonetic:"ˋpændə",img:"panda.jpg"),
        Voca(eName:"parakeet",cName:"鸚鵡",phonetic:"ˋpærə͵kit",img:"parakeet.jpg"),
        Voca(eName:"parasol",cName:"陽傘",phonetic:"ˋpærə͵sɔl",img:"parasol.jpg"),
        Voca(eName:"parcel",cName:"包裹",phonetic:"ˋpɑrs!",img:"parcel.jpg"),
        Voca(eName:"pard",cName:"豹",phonetic:"pɑrd",img:"pard.jpg"),
        Voca(eName:"partridge",cName:"鷓鴣",phonetic:"ˋpɑrtrɪdʒ",img:"partridge.jpg"),
        Voca(eName:"passenger",cName:"乘客",phonetic:"ˋpæsndʒɚ",img:"passenger.png"),
        Voca(eName:"pastry",cName:"糕點",phonetic:"ˋpestrɪ",img:"pastry.jpg"),
        Voca(eName:"pasture",cName:"牧場",phonetic:"ˋpæstʃɚ",img:"pasture.jpg"),
        Voca(eName:"patio",cName:"露臺",phonetic:"ˋpɑtɪ͵o",img:"patio.jpg"),
        Voca(eName:"pear",cName:"梨",phonetic:"pɛr",img:"pear.jpg"),
        Voca(eName:"pedal",cName:"踏板",phonetic:"ˋpɛd!",img:"pedal.jpg"),
        Voca(eName:"peddler",cName:"小販",phonetic:"ˋpɛdlɚ",img:"peddler.jpg"),
        Voca(eName:"pencil",cName:"鉛筆",phonetic:"ˋpɛns!",img:"pencil.png"),
        Voca(eName:"penguin",cName:"企鵝",phonetic:"ˋpɛngwɪn",img:"penguin.jpg"),
        Voca(eName:"peony",cName:"牡丹",phonetic:"ˋpiənɪ",img:"peony.jpg"),
        Voca(eName:"periwig",cName:"假髮",phonetic:"ˋpɛrə͵wɪg",img:"periwig.jpg"),
        Voca(eName:"permit",cName:"執照",phonetic:"pɚˋmɪt",img:"permit.jpg"),
        Voca(eName:"persimmon",cName:"柿子",phonetic:"pɚˋsɪmən",img:"persimmon.jpg"),
        Voca(eName:"pesticide",cName:"殺蟲劑",phonetic:"ˋpɛstɪ͵saɪd",img:"pesticide.jpg"),
        Voca(eName:"petal",cName:"花瓣",phonetic:"ˋpɛt!",img:"petal.jpg"),
        Voca(eName:"petrel",cName:"海燕",phonetic:"ˋpɛtrəl",img:"petrel.jpg"),
        Voca(eName:"petroleum",cName:"石油",phonetic:"pəˋtrolɪəm",img:"petroleum.jpg"),
        Voca(eName:"quack",cName:"庸醫",phonetic:"kwæk",img:"quack.jpg"),
        Voca(eName:"quadrangle",cName:"四邊形",phonetic:"ˋkwɑdræŋg!",img:"quadrangle.png"),
        Voca(eName:"quagmire",cName:"沼澤地",phonetic:"ˋkwæg͵maɪr",img:"quagmire.jpg"),
        Voca(eName:"quail",cName:"鵪鶉",phonetic:"kwel",img:"quail.jpg"),
        Voca(eName:"quaint",cName:"古色古香的",phonetic:"kweɪnt",img:"quaint.jpg"),
        Voca(eName:"quake",cName:"地震",phonetic:"kwek",img:"quake.jpg"),
        Voca(eName:"qualification",cName:"執照",phonetic:"͵kwɑləfəˋkeʃən",img:"qualification.jpg"),
        Voca(eName:"qualm",cName:"不安",phonetic:"kwɔm",img:"qualm.jpg"),
        Voca(eName:"quandary",cName:"困惑",phonetic:"ˋkwɑndərɪ",img:"quandary.jpg"),
        Voca(eName:"quarantine",cName:"隔離",phonetic:"ˋkwɔrən͵tin",img:"quarantine.png"),
        Voca(eName:"quarrel",cName:"爭吵",phonetic:"ˋkwɔrəl",img:"quarrel.jpg"),
        Voca(eName:"quarry",cName:"採石場",phonetic:"ˋkwɔrɪ",img:"quarry.jpg"),
        Voca(eName:"quarter",cName:"住所",phonetic:"ˋkwɔrtɚ",img:"quarter.jpg"),
        Voca(eName:"quartermaster",cName:"軍需官",phonetic:"ˋkwɔrtɚ͵mæstɚ",img:"quartermaster.jpg"),
        Voca(eName:"quartet",cName:"四重奏",phonetic:"kwɔrˋtɛt",img:"quartet.png"),
        Voca(eName:"quartz",cName:"石英",phonetic:"kwɔrts",img:"quartz.jpg"),
        Voca(eName:"quasar",cName:"類星體",phonetic:"ˋkwesɑr",img:"quasar.jpg"),
        Voca(eName:"quaver",cName:"震動",phonetic:"ˋkwevɚ",img:"quaver.jpg"),
        Voca(eName:"quay",cName:"碼頭",phonetic:"ki",img:"quay.jpg"),
        Voca(eName:"queen",cName:"女皇",phonetic:"ˋkwin",img:"queen.png"),
        Voca(eName:"quell",cName:"鎮壓",phonetic:"kwɛl",img:"quell.jpg"),
        Voca(eName:"quench",cName:"熄滅",phonetic:"kwɛntʃ",img:"quench.jpg"),
        Voca(eName:"quest",cName:"尋找",phonetic:"kwɛst",img:"quest.jpg"),
        Voca(eName:"questionable",cName:"可疑的",phonetic:"ˋkwɛstʃənəb!",img:"questionable.jpg"),
        Voca(eName:"questionnaire",cName:"問卷",phonetic:"͵kwɛstʃənˋɛr",img:"questionnaire.jpg"),
        Voca(eName:"queue",cName:"列隊",phonetic:"kju",img:"queue.jpg"),
        Voca(eName:"quicksand",cName:"流沙",phonetic:"ˋkwɪk͵sænd",img:"quicksand.jpg"),
        Voca(eName:"quicksilver",cName:"水銀",phonetic:"ˋkwɪk͵sɪlvɚ",img:"quicksilver.jpg"),
        Voca(eName:"quilt",cName:"被子",phonetic:"kwɪlt",img:"quilt.jpg"),
        Voca(eName:"quisling",cName:"內奸",phonetic:"ˋkwɪz!ɪŋ",img:"quisling.jpg"),
        Voca(eName:"rabbit",cName:"兔子",phonetic:"ˈrabət",img:"rabbit.jpg"),
        Voca(eName:"raccoon",cName:"浣熊",phonetic:"raˈko͞on",img:"raccoon.jpg"),
        Voca(eName:"racket",cName:"球拍",phonetic:"ˈrakət",img:"racket.jpg"),
        Voca(eName:"radish",cName:"小蘿蔔",phonetic:"ˈradiSH",img:"radish.jpg"),
        Voca(eName:"railway",cName:"鐵路",phonetic:"ˈrālˌwā",img:"railway.jpg"),
        Voca(eName:"rainbow",cName:"彩虹",phonetic:"ˈrānˌbō",img:"rainbow.jpg"),
        Voca(eName:"rainbow trout",cName:"虹鱒魚",phonetic:"ˈˌrānbō ˈtrout",img:"rainbow trout.jpg"),
        Voca(eName:"raisin",cName:"葡萄乾",phonetic:"ˈrāzən",img:"raisin.jpg"),
        Voca(eName:"ram",cName:"公羊",phonetic:"ram",img:"ram.jpg"),
        Voca(eName:"razorback",cName:"野豬",phonetic:"ˈrāzər,bak",img:"razorback.jpg"),
        Voca(eName:"red squirrel",cName:"紅松鼠",phonetic:"red ˈskwər(ə)l",img:"red squirrel.jpg"),
        Voca(eName:"redbird",cName:"紅雀",phonetic:"ˈredbə:d",img:"redbird.jpg"),
        Voca(eName:"redbreast",cName:"知更鳥",phonetic:"ˈredˌbrest",img:"redbreast.jpg"),
        Voca(eName:"redhead",cName:"紅頭鴨",phonetic:"ˈredˌhed",img:"redhead.jpg"),
        Voca(eName:"redwing",cName:"紅翼鶇",phonetic:"ˈredwiNG",img:"redwing.jpg"),
        Voca(eName:"refrigerator",cName:"冰箱",phonetic:"rəˈfrijəˌrādər",img:"refrigerator.jpg"),
        Voca(eName:"reindeer",cName:"馴鹿",phonetic:"ˈrānˌdi",img:"reindeer.jpg"),
        Voca(eName:"reservoir",cName:"水庫",phonetic:"ˈrezər,vwär",img:"reservoir.jpg"),
        Voca(eName:"restaurant",cName:"餐廳",phonetic:"ˈrest(ə)rənt",img:"restaurant.jpg"),
        Voca(eName:"rhinoceros",cName:"犀牛",phonetic:"rīˈnäs(ə)rəs",img:"rhinoceros.jpg"),
        Voca(eName:"rice",cName:"米飯",phonetic:"rīs",img:"rice.jpg"),
        Voca(eName:"rick",cName:"乾草堆",phonetic:"rik",img:"rick.jpg"),
        Voca(eName:"ringdove",cName:"斑鳩",phonetic:"ˈriNGdəv",img:"ringdove.jpg"),
        Voca(eName:"rink",cName:"溜冰場",phonetic:"riNGk",img:"rink.jpg"),
        Voca(eName:"river",cName:"河",phonetic:"ˈrivər",img:"river.jpg"),
        Voca(eName:"robot",cName:"機器人",phonetic:"ˈrōbət",img:"robot.jpg"),
        Voca(eName:"roebuck",cName:"雄鹿",phonetic:"ˈrōˌbək",img:"roebuck.jpg"),
        Voca(eName:"rooster",cName:"公雞",phonetic:"ˈro͞ostər",img:"rooster.jpg"),
        Voca(eName:"rose",cName:"玫瑰花",phonetic:"rōz",img:"rose.jpg"),
        Voca(eName:"rosemary",cName:"迷迭香",phonetic:"ˈrōz,merē",img:"rosemary.jpg"),
        Voca(eName:"saber",cName:"軍刀",phonetic:"ˋsebɚ",img:"saber.jpg"),
        Voca(eName:"sable",cName:"黑貂",phonetic:"ˋseb!",img:"sable.jpg"),
        Voca(eName:"sachem",cName:"酋長",phonetic:"ˋsetʃəm",img:"sachem.jpg"),
        Voca(eName:"sacrament",cName:"聖禮",phonetic:"ˋsækrəmənt",img:"sacrament.jpg"),
        Voca(eName:"saddle",cName:"馬鞍",phonetic:"ˋsæd!",img:"saddle.jpg"),
        Voca(eName:"sailboat",cName:"帆船",phonetic:"ˋsel͵bot",img:"sailboat.jpg"),
        Voca(eName:"sailor",cName:"水手",phonetic:"ˋselɚ",img:"sailor.jpg"),
        Voca(eName:"salacity",cName:"好色",phonetic:"səˋlæsətɪ",img:"salacity.jpg"),
        Voca(eName:"salad",cName:"沙拉",phonetic:"ˋsæləd",img:"salad.jpg"),
        Voca(eName:"salamander",cName:"火蜥蜴",phonetic:"ˋsælə͵mændɚ",img:"salamander.jpg"),
        Voca(eName:"salary",cName:"薪水",phonetic:"ˋsælərɪ",img:"salary.jpg"),
        Voca(eName:"sale",cName:"銷售",phonetic:"sel",img:"sale.jpg"),
        Voca(eName:"salt",cName:"鹽",phonetic:"sɔlt",img:"salt.jpg"),
        Voca(eName:"saltpeter",cName:"硝石",phonetic:"ˋsɔlt͵pitɚ",img:"saltpeter.jpg"),
        Voca(eName:"samisen",cName:"三弦琴",phonetic:"ˋsæmə͵sɛn",img:"samisen.jpg"),
        Voca(eName:"sanctuary",cName:"聖堂",phonetic:"ˋsæŋktʃʊ͵ɛrɪ",img:"sanctuary.jpg"),
        Voca(eName:"sand",cName:"沙",phonetic:"sænd",img:"sand.jpg"),
        Voca(eName:"sap",cName:"樹液",phonetic:"sæp",img:"sap.jpg"),
        Voca(eName:"sarcoma",cName:"肉瘤",phonetic:"sɑrˋkomə",img:"sarcoma.jpg"),
        Voca(eName:"sarcophagus",cName:"石棺",phonetic:"sɑrˋkɑfəgəs",img:"sarcophagus.jpg"),
        Voca(eName:"sardine",cName:"沙丁魚",phonetic:"sɑrˋdin",img:"sardine.jpg"),
        Voca(eName:"sargasso",cName:"馬尾藻",phonetic:"sɑrˋgæso",img:"sargasso.jpg"),
        Voca(eName:"satchel",cName:"書包",phonetic:"ˋsætʃəl",img:"satchel.jpg"),
        Voca(eName:"Saturn",cName:"土星",phonetic:"ˋsætɚn",img:"Saturn.jpg"),
        Voca(eName:"sausage",cName:"香腸",phonetic:"ˋsɔsɪdʒ",img:"sausage.jpg"),
        Voca(eName:"scabbard",cName:"槍套",phonetic:"ˋskæbɚd",img:"scabbard.jpg"),
        Voca(eName:"scale",cName:"天秤",phonetic:"skel",img:"scale.jpg"),
        Voca(eName:"scallop",cName:"扇貝",phonetic:"ˋskɑləp",img:"scallop.jpg"),
        Voca(eName:"slaver",cName:"盤子",phonetic:"ˋslevɚ",img:"slaver.jpg"),
        Voca(eName:"surf",cName:"海浪",phonetic:"sɝf",img:"surf.jpg"),
        Voca(eName:"Tablespoon",cName:"大湯匙",phonetic:"ˈtābəlˌspo͞on",img:"tablespoon.jpg"),
        Voca(eName:"Tablet",cName:"平板",phonetic:"ˈtablət",img:"tablet.jpg"),
        Voca(eName:"Tailor",cName:"裁縫師",phonetic:"ˈtālər",img:"tailor.jpg"),
        Voca(eName:"Tale",cName:"故事",phonetic:"tāl",img:"tale.jpg"),
        Voca(eName:"Tangerine",cName:"橘子",phonetic:"ˌtanjəˈrēn",img:"tangerine.jpg"),
        Voca(eName:"Tanker",cName:"油輪",phonetic:"ˈtaNGkər",img:"tanker.jpg"),
        Voca(eName:"Technician",cName:"技術人員",phonetic:"tekˈniSHən",img:"technician.jpg"),
        Voca(eName:"Teenager",cName:"青少年",phonetic:"ˈtēnˌājər",img:"teenager.png"),
        Voca(eName:"Telegram",cName:"電報",phonetic:"telegram",img:"telegram.jpg"),
        Voca(eName:"Telescope",cName:"望遠鏡",phonetic:"ˈteləˌskōp",img:"telescope.jpg"),
        Voca(eName:"Television",cName:"電視",phonetic:"ˈteləˌviZHən",img:"television.jpg"),
        Voca(eName:"Temperature",cName:"溫度",phonetic:"ˈtemp(ə)rəCHər",img:"temperature.jpg"),
        Voca(eName:"Throat",cName:"喉嚨",phonetic:"THrōt",img:"throat.jpg"),
        Voca(eName:"Thunderstorm",cName:"大雷雨",phonetic:"ˈTHəndərˌstôrm",img:"thunderstorm.jpg"),
        Voca(eName:"Tissue",cName:"衛生紙",phonetic:"ˈtiSHo͞o",img:"tissue.jpg"),
        Voca(eName:"Topics",cName:"熱帶",phonetic:"ˈtäpik",img:"topics.jpg"),
        Voca(eName:"Tourist",cName:"觀光客",phonetic:"ˈto͝orəst",img:"tourist.jpg"),
        Voca(eName:"Township",cName:"鄉",phonetic:"ˈtounˌSHip",img:"township.jpg"),
        Voca(eName:"Track",cName:"軌道",phonetic:"trak",img:"track.jpg"),
        Voca(eName:"Trademark",cName:"商標",phonetic:"ˈtrādˌmärk",img:"trademark.jpg"),
        Voca(eName:"Transfusion",cName:"輸血",phonetic:"ˌtran(t)sˈfyo͞oZHən",img:"transfusion.jpg"),
        Voca(eName:"Translator",cName:"翻譯機",phonetic:"ˈtransˌlādər",img:"translator.jpg"),
        Voca(eName:"Tribe",cName:"部落",phonetic:"trīb",img:"tribe.jpg"),
        Voca(eName:"Trolley",cName:"手推車",phonetic:"ˈträlē",img:"trolley.jpg"),
        Voca(eName:"Trousers",cName:"褲子",phonetic:"ˈtrouzərz",img:"trousers.jpg"),
        Voca(eName:"Trout",cName:"鮭魚",phonetic:"trout",img:"trout.jpg"),
        Voca(eName:"Trumpet",cName:"喇叭",phonetic:"ˈtrəmpət",img:"trumpet.jpg"),
        Voca(eName:"Tuxedo",cName:"燕尾服",phonetic:"təkˈsēdō",img:"tuxedo.jpg"),
        Voca(eName:"Typhoon",cName:"颱風",phonetic:"tīˈfo͞on",img:"typhoon.jpg"),
        Voca(eName:"Tyre",cName:"輪胎",phonetic:"tī(ə)r",img:"tyre.jpg"),
        Voca(eName:"umbrella",cName:"雨傘",phonetic:"ʌmˋbrɛlə",img:"umbrella.jpg"),
        Voca(eName:"ump",cName:"裁判",phonetic:"ʌmp",img:"ump.jpg"),
        Voca(eName:"uncle",cName:"叔叔",phonetic:"ˋʌŋk!",img:"uncle.jpg"),
        Voca(eName:"undershirt",cName:"汗衫",phonetic:"ˋʌndɚ͵ʃɝt",img:"undershirt.jpg"),
        Voca(eName:"undertaker",cName:"企業家",phonetic:"͵ʌndɚˋtekɚ",img:"undertaker.jpg"),
        Voca(eName:"undoing",cName:"毀滅",phonetic:"ʌnˋduɪŋ",img:"undoing.jpg"),
        Voca(eName:"unguent",cName:"藥膏",phonetic:"ˋʌŋgwənt",img:"unguent.jpg"),
        Voca(eName:"unicorn",cName:"獨角獸",phonetic:"ˋjunɪ͵kɔrn",img:"unicorn.png"),
        Voca(eName:"universe",cName:"宇宙",phonetic:"ˋjunə͵vɝs",img:"universe.jpg"),
        Voca(eName:"university",cName:"大學",phonetic:"͵junəˋvɝsətɪ",img:"university.jpg"),
        Voca(eName:"untruth",cName:"謊言",phonetic:"ʌnˋtruθ",img:"untruth.jpg"),
        Voca(eName:"update",cName:"更新",phonetic:"ʌpˋdet",img:"update.jpg"),
        Voca(eName:"upland",cName:"高地",phonetic:"ˋʌplənd",img:"upland.jpg"),
        Voca(eName:"upraise",cName:"舉起",phonetic:"ʌpˋrez",img:"upraise.jpg"),
        Voca(eName:"uprear",cName:"扶養",phonetic:"ʌpˋrɪr",img:"uprear.jpg"),
        Voca(eName:"uprising",cName:"叛亂",phonetic:"ˋʌp͵raɪzɪŋ",img:"uprising.jpg"),
        Voca(eName:"uproar",cName:"擾亂",phonetic:"ˋʌp͵ror",img:"uproar.jpg"),
        Voca(eName:"upset",cName:"難過的",phonetic:"ʌpˋsɛt",img:"upset.jpg"),
        Voca(eName:"upshot",cName:"結尾",phonetic:"ˋʌp͵ʃɑt",img:"upshot.jpg"),
        Voca(eName:"upswing",cName:"上升",phonetic:"ˋʌp͵swɪŋ",img:"upswing.jpg"),
        Voca(eName:"uptown",cName:"住宅區",phonetic:"ˋʌpˋtaʊn",img:"uptown.jpg"),
        Voca(eName:"uranium",cName:"軸",phonetic:"jʊˋrenɪəm",img:"uranium.jpg"),
        Voca(eName:"Uranus",cName:"天王星",phonetic:"ˋjʊərənəs",img:"Uranus.jpg"),
        Voca(eName:"urchin",cName:"小孩",phonetic:"ˋɝtʃɪn",img:"urchin.png"),
        Voca(eName:"urinal",cName:"尿壺",phonetic:"ˋjʊrən!",img:"urinal.jpg"),
        Voca(eName:"urn",cName:"甕",phonetic:"ɝn",img:"urn.jpg"),
        Voca(eName:"user",cName:"用戶",phonetic:"ˋjuzɚ",img:"user.png"),
        Voca(eName:"usher",cName:"招待員",phonetic:"ˋʌʃɚ",img:"usher.jpg"),
        Voca(eName:"ute",cName:"載貨汽車",phonetic:"juːt",img:"ute.jpg"),
        Voca(eName:"uterus",cName:"子宮",phonetic:"ˋjutərəs",img:"uterus.jpg"),
        Voca(eName:"valentine",cName:"情人",phonetic:"ˋvæləntaɪn",img:"valentine.jpg"),
        Voca(eName:"valise",cName:"旅行袋",phonetic:"vəˋlis",img:"valise.jpg"),
        Voca(eName:"valley",cName:"山谷",phonetic:"ˋvælɪ",img:"valley.jpg"),
        Voca(eName:"vampire",cName:"吸血鬼",phonetic:"ˋvæmpaɪr",img:"vampire.jpg"),
        Voca(eName:"van",cName:"運貨車",phonetic:"væn",img:"van.jpg"),
        Voca(eName:"vanguard",cName:"先鋒",phonetic:"ˋvæn͵gɑrd",img:"vanguard.jpg"),
        Voca(eName:"vanilla",cName:"香草",phonetic:"vəˋnɪlə",img:"vanilla.jpg"),
        Voca(eName:"vapor",cName:"蒸氣",phonetic:"ˋvepɚ",img:"vapor.jpg"),
        Voca(eName:"varlet",cName:"惡棍",phonetic:"ˋvɑrlɪt",img:"varlet.jpg"),
        Voca(eName:"vaseline",cName:"凡士林",phonetic:"ˋvæs!͵in",img:"vaseline.jpg"),
        Voca(eName:"vassal",cName:"諸侯",phonetic:"ˋvæs!",img:"vassal.jpg"),
        Voca(eName:"vaudeville",cName:"雜耍",phonetic:"ˋvodə͵vɪl",img:"vaudeville.jpg"),
        Voca(eName:"vegetable",cName:"蔬菜",phonetic:"ˋvɛdʒətəb!",img:"vegetable.jpg"),
        Voca(eName:"vegetation",cName:"植物",phonetic:"͵vɛdʒəˋteʃən",img:"vegetation.jpg"),
        Voca(eName:"veil",cName:"面紗",phonetic:"vel",img:"veil.jpg"),
        Voca(eName:"vein",cName:"靜脈",phonetic:"ven",img:"vein.jpg"),
        Voca(eName:"velvet",cName:"絲絨",phonetic:"ˋvɛlvɪt",img:"velvet.jpg"),
        Voca(eName:"vendor",cName:"小販",phonetic:"ˋvɛndɚ",img:"vendor.png"),
        Voca(eName:"vest",cName:"馬甲",phonetic:"vɛst",img:"vest.jpg"),
        Voca(eName:"vestment",cName:"官服",phonetic:"ˋvɛstmənt",img:"vestment.jpg"),
        Voca(eName:"vesture",cName:"衣服",phonetic:"ˋvɛstʃɚ",img:"vesture.jpg"),
        Voca(eName:"vetch",cName:"野豌豆",phonetic:"vɛtʃ",img:"vetch.jpg"),
        Voca(eName:"viaduct",cName:"高架橋",phonetic:"ˋvaɪə͵dʌkt",img:"viaduct.jpg"),
        Voca(eName:"villa",cName:"別墅",phonetic:"ˋvɪlə",img:"villa.jpg"),
        Voca(eName:"villain",cName:"壞人",phonetic:"ˋvɪlən",img:"villain.png"),
        Voca(eName:"vinegar",cName:"醋",phonetic:"ˋvɪnɪgɚ",img:"vinegar.jpg"),
        Voca(eName:"viola",cName:"中提琴",phonetic:"vɪˋolə",img:"viola.jpg"),
        Voca(eName:"violin",cName:"小提琴",phonetic:"͵vaɪəˋlɪn",img:"violin.jpg"),
        Voca(eName:"violoncello",cName:"大提琴",phonetic:"͵viəlɑnˋtʃɛlo",img:"violoncello.jpg"),
        Voca(eName:"volcano",cName:"火山",phonetic:"vɑlˋkeno",img:"volcano.jpg"),
        Voca(eName:"wafer",cName:"晶片",phonetic:"ˋwefɚ",img:"wafer.jpg"),
        Voca(eName:"waft",cName:"漂浮",phonetic:"wæft",img:"waft.jpg"),
        Voca(eName:"wag",cName:"搖擺",phonetic:"wæg",img:"wag.jpg"),
        Voca(eName:"wage",cName:"工資",phonetic:"wedʒ",img:"wage.jpg"),
        Voca(eName:"wager",cName:"賭",phonetic:"ˋwedʒɚ",img:"wager.jpg"),
        Voca(eName:"wagon",cName:"敞篷車廂",phonetic:"ˋwægən",img:"wagon.jpg"),
        Voca(eName:"wagoner",cName:"車夫",phonetic:"ˋwægənɚ",img:"wagoner.jpg"),
        Voca(eName:"waist",cName:"腰",phonetic:"west",img:"waist.jpg"),
        Voca(eName:"waistcoat",cName:"背心",phonetic:"ˋwest͵kot",img:"waistcoat.jpg"),
        Voca(eName:"wallet",cName:"皮包",phonetic:"ˋwɑlɪt",img:"wallet.jpg"),
        Voca(eName:"walnut",cName:"胡桃",phonetic:"ˋwɔlnət",img:"walnut.jpg"),
        Voca(eName:"walrus",cName:"海象",phonetic:"ˋwɔlrəs",img:"walrus.jpg"),
        Voca(eName:"wand",cName:"棒",phonetic:"wɑnd",img:"wand.jpg"),
        Voca(eName:"war",cName:"戰爭",phonetic:"wɔr",img:"war.jpg"),
        Voca(eName:"ward",cName:"病房",phonetic:"wɔrd",img:"ward.jpg"),
        Voca(eName:"warden",cName:"典獄長",phonetic:"ˋwɔrdn",img:"warden.jpg"),
        Voca(eName:"wardrobe",cName:"衣櫥",phonetic:"ˋwɔrd͵rob",img:"wardrobe.jpg"),
        Voca(eName:"warehouse",cName:"倉庫",phonetic:"ˋwɛr͵haʊs",img:"warehouse.jpg"),
        Voca(eName:"warrior",cName:"武士",phonetic:"ˋwɔrɪɚ",img:"warrior.jpg"),
        Voca(eName:"warship",cName:"軍艦",phonetic:"ˋwɔr͵ʃɪp",img:"warship.jpg"),
        Voca(eName:"washboard",cName:"洗衣板",phonetic:"ˋwɑʃ͵bord",img:"washboard.jpg"),
        Voca(eName:"washroom",cName:"洗手間",phonetic:"ˋwɑʃ͵rum",img:"washroom.jpg"),
        Voca(eName:"wasp",cName:"黃蜂",phonetic:"wɑsp",img:"wasp.jpg"),
        Voca(eName:"watch",cName:"手錶",phonetic:"wɑtʃ",img:"watch.jpg"),
        Voca(eName:"water",cName:"水",phonetic:"ˋwɔtɚ",img:"water.jpg"),
        Voca(eName:"waterfall",cName:"瀑布",phonetic:"ˋwɔtɚ͵fɔl",img:"waterfall.jpg"),
        Voca(eName:"waterman",cName:"漁夫",phonetic:"ˋwɔtɚmən",img:"waterman.jpg"),
        Voca(eName:"wave",cName:"波",phonetic:"wev",img:"wave.jpg"),
        Voca(eName:"wayfarer",cName:"旅客",phonetic:"ˋwe͵fɛrɚ",img:"wayfarer.jpg"),
        Voca(eName:"weapon",cName:"武器",phonetic:"ˋwɛpən",img:"weapon.jpg"),
        Voca(eName:"xerophyte",cName:"旱生植物",phonetic:"ˋzɪrə͵faɪt",img:"xerophyte.jpg"),
        Voca(eName:"Xerox",cName:"複印",phonetic:"ˋzɪrɑks",img:"Xerox.jpg"),
        Voca(eName:"X'mas",cName:"聖誕節",phonetic:"ˋkrɪsməs",img:"X'mas.jpg"),
        Voca(eName:"X-ray",cName:"X光",phonetic:"ˋɛksˋre",img:"X-ray.jpg"),
        Voca(eName:"xylem",cName:"木質部",phonetic:"ˋzaɪlɛm",img:"xylem.jpg"),
        Voca(eName:"xylophone",cName:"木琴",phonetic:"ˋzaɪlə͵fon",img:"xylophone.jpg"),
        Voca(eName:"yacht",cName:"快艇",phonetic:"jɑt",img:"yacht.jpg"),
        Voca(eName:"yak",cName:"犛牛",phonetic:"jæk",img:"yak.jpg"),
        Voca(eName:"yam",cName:"山藥",phonetic:"jæm",img:"yam.jpg"),
        Voca(eName:"yarn",cName:"紗線",phonetic:"jɑrn",img:"yarn.jpg"),
        Voca(eName:"yawl",cName:"小艇",phonetic:"jɔl",img:"yawl.jpg"),
        Voca(eName:"yawn",cName:"呵欠",phonetic:"jɔn",img:"yawn.jpg"),
        Voca(eName:"yeast",cName:"泡沫",phonetic:"jist",img:"yeast.jpg"),
        Voca(eName:"yellow",cName:"黃色",phonetic:"ˋjɛlo",img:"yellow.png"),
        Voca(eName:"yelp",cName:"叫喊",phonetic:"jɛlp",img:"yelp.jpg"),
        Voca(eName:"yeoman",cName:"自耕農",phonetic:"ˋjomən",img:"yeoman.jpg"),
        Voca(eName:"yew",cName:"紫杉",phonetic:"ju",img:"yew.jpg"),
        Voca(eName:"yoghurt",cName:"優酪乳",phonetic:"ˋjogɚt",img:"yoghurt.jpg"),
        Voca(eName:"yogurt",cName:"優格",phonetic:"ˋjogɚt",img:"yogurt.jpg"),
        Voca(eName:"yoke",cName:"枷鎖",phonetic:"jok",img:"yoke.jpg"),
        Voca(eName:"yokefellow",cName:"同事",phonetic:"ˋjok͵fɛlo",img:"yokefellow.jpg"),
        Voca(eName:"yokel",cName:"鄉巴佬",phonetic:"ˋjok!",img:"yokel.jpg"),
        Voca(eName:"yolk",cName:"蛋黃",phonetic:"jok",img:"yolk.png"),
        Voca(eName:"young",cName:"年輕的",phonetic:"jʌŋ",img:"young.jpg"),
        Voca(eName:"yo-yo",cName:"溜溜球",phonetic:"ˋjo͵jo",img:"yo-yo.jpg"),
        Voca(eName:"yule",cName:"聖誕節",phonetic:"jul",img:"yule.jpg"),
        Voca(eName:"zany",cName:"小丑",phonetic:"ˋzenɪ",img:"zany.png"),
        Voca(eName:"zealot",cName:"狂熱分子",phonetic:"ˋzɛlət",img:"zealot.jpg"),
        Voca(eName:"zebra",cName:"斑馬",phonetic:"ˋzibrə",img:"zebra.jpg"),
        Voca(eName:"zebu",cName:"犛牛",phonetic:"ˋzibju",img:"zebu.jpg"),
        Voca(eName:"zenith",cName:"天頂",phonetic:"ˋzinɪθ",img:"zenith.jpg"),
        Voca(eName:"zephyr",cName:"和風",phonetic:"ˋzɛfɚ",img:"zephyr.jpg"),
        Voca(eName:"zero",cName:"零",phonetic:"ˋzɪro",img:"zero.jpg"),
        Voca(eName:"Zeus",cName:"宙斯",phonetic:"zjus",img:"Zeus.jpg"),
        Voca(eName:"zion",cName:"天國",phonetic:"ˋzaɪən",img:"zion.jpg"),
        Voca(eName:"zip",cName:"拉鍊",phonetic:"zɪp",img:"zip.png"),
        Voca(eName:"zipcode",cName:"郵政編號",phonetic:"zɪp kod",img:"zipcode.jpg"),
        Voca(eName:"zipper",cName:"拉鍊",phonetic:"ˋzɪpɚ",img:"zipper.jpg"),
        Voca(eName:"zither",cName:"箏",phonetic:"ˋzɪθɚ",img:"zither.jpg"),
        Voca(eName:"zodiac",cName:"十二宮圖",phonetic:"ˋzodɪ͵æk",img:"zodiac.jpg"),
        Voca(eName:"zone",cName:"地區",phonetic:"zon",img:"zone.jpg"),
        Voca(eName:"zoo",cName:"動物園",phonetic:"zu",img:"zoo.jpg"),
        Voca(eName:"zygote",cName:"受精卵",phonetic:"ˋzaɪgot",img:"zygote.jpg"),

    ]
 
    let speechSynthesizer = AVSpeechSynthesizer()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func speak(speakText: String, lang : String) {
        if !speechSynthesizer.isSpeaking {
            let speechUtterance = AVSpeechUtterance(string: speakText)
            //speechUtterance.rate = rate
            speechUtterance.pitchMultiplier = 1.0
            speechUtterance.volume = 1.0
            speechUtterance.postUtteranceDelay = 0.005
            speechUtterance.voice = AVSpeechSynthesisVoice(language: lang)
            speechSynthesizer.speak(speechUtterance)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getVoca()
        if VocaList.count != 0 {
            delVoca()
        }
        for item  in InitVoca {
            addVoca(eName: item.eName, cName: item.cName, phonetic: item.phonetic, img: item.img)
        }
        getVoca()
        
        
        let url = URL(string: "http://140.115.197.16/?school=nkfust&app=FirstVocabulary")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
           // let json = try! JSONSerialization.jsonObject(with: data, options: [])
            //print(json)
        }
        
        task.resume()
        //speak(speakText: "Welcome to my Application",lang: "en-IE");

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return VocaList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "VocaCell"
        let tvcells = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! VocaTableViewCell
        tvcells.accessoryType = .disclosureIndicator
        tvcells.cName.text = VocaList[indexPath.row].cName
        tvcells.eName.text = VocaList[indexPath.row].eName
        tvcells.Phonetic.text = "[" + VocaList[indexPath.row].phonetic! + "]"
        tvcells.Img.image = UIImage(data: VocaList[indexPath.row].img! as Data)
        //tvcells.Img.image = UIImage(named: VocaList[indexPath.row].eName! + ".jpg")
        tvcells.Img.layer.cornerRadius = 15
        tvcells.Img.clipsToBounds = true
        return tvcells
    }
   
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "分享", handler: { (action, indexPath) -> Void in
            let defaultText = "一個新單字\r\n【" + self.VocaList[indexPath.row].cName!  + "】" + self.VocaList[indexPath.row].eName!
            if let imageToShare = UIImage(data: self.VocaList[indexPath.row].img! as Data) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                activityController.popoverPresentationController?.sourceView = self.view
                activityController.popoverPresentationController?.sourceRect = (tableView.cellForRow(at: indexPath)?.frame)!
                self.present(activityController,animated: true, completion: nil)
            }
        })
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "刪除", handler: { (action, indexPath) -> Void in
            
            self.VocaList.remove(at: indexPath.row)
            //tableView.reloadData()
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        let speakAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "發音", handler: { (action, indexPath) -> Void in
            self.speak(speakText: self.VocaList[indexPath.row].eName! + "," + self.VocaList[indexPath.row].cName!  , lang: "zh-TW")
        })

        speakAction.backgroundColor = UIColor(red: 91.0/255.0, green: 192.0/255.0, blue: 222.0/255.0, alpha: 1.0)
        shareAction.backgroundColor = UIColor(red: 92.0/255.0, green: 184.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 217.0/255.0, green: 83.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction, speakAction]
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVocaDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let nextController = segue.destination as! VocaDetailViewController
                nextController.Voca = VocaList[indexPath.row]
            }
        }
    }
    

}
