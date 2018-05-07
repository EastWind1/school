<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<title>隐私政策</title>
<jsp:include page="../common.jsp"></jsp:include>
<style type="text/css">
* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

html {
	-ms-touch-action: none;
	font-size:62.5%;
}

body,ul,li {
	padding: 0;
	margin: 0;
	border: 0;
}

body {
	font-size: 12px;
	font-family: ubuntu, helvetica, arial;
	overflow: hidden; /* this is important to prevent the whole page to bounce */
}

#footer {
	position: absolute;
	z-index: 2;
	bottom: 0;
	left: 0;
	margin-top:100px;
	width: 100%;
	height: 90px;
	background: #e1e4e9;
	padding: 10;
	border-top: 0px;
	border-top:1px solid #ccc;
}

#wrapper {
	position: absolute;
	z-index: 1;
	top: 45px;
	bottom: 48px;
	left: 0;
	width: 100%;
	background: #e1e4e9;
	overflow: hidden;
}

#scroller {
	position: absolute;
	z-index: 1;
	-webkit-tap-highlight-color: rgba(0,0,0,0);
	width: 100%;
	-webkit-transform: translateZ(0);
	-moz-transform: translateZ(0);
	-ms-transform: translateZ(0);
	-o-transform: translateZ(0);
	transform: translateZ(0);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-text-size-adjust: none;
	-moz-text-size-adjust: none;
	-ms-text-size-adjust: none;
	-o-text-size-adjust: none;
	text-size-adjust: none;
}

#header {
	position: absolute;
	z-index: 2;
	top: 0;
	left: 0;
	width: 100%;
	height: 45px;
	line-height: 45px;
	background: #e1e4e9;
	padding: 0;
	color: #000;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	border-bottom:1px solid #ccc;
}

		pre{ font-size: 1.2rem;}
		.thirdTitle{font-size: 1.3rem;color:#595353; font-weight:bold; display:block}
		.sececd_title{font-size: 1.5rem; color: #000; font-weight:bold; display:block}
		.agree_tk{ margin:5px auto;text-align:center; }
		.agree_tk label{ display: inline-block; }
		#agree_box{ margin-top:-2px;width: 25px;height: 25px;}
		.agree_tk .reg_now{ 
		 	height: 30px; 
		 	display: block;
		 	background-color: #C3C3C3;
		 	color: #A09B9B;
		 	border-radius: 5px; 
		 	line-height: 30px; 
		 	text-align: center; 
		 	font-size: 1.3rem; 
		 	margin: 10px;
		 }
		 .agree_tk .reg_now.active{
		 	height: 30px; 
		 	display: block;
		 	background-color: #458de6;
		 	color: #000;
		 	text-decoration:none;
		 	cursor:pointer;
		 	margin: 10px;
		 }
		 
		 .box{ margin:0 10px; border-left: 1px solid #ccc;border-right: 1px solid #ccc;border-radius:5px;padding:5px;padding-bottom:100px;}
</style>
<script type="text/javascript" src="common/iscroll.js"></script>
<script type="text/javascript">
var myScroll;

function loaded () {
	myScroll = new IScroll('#wrapper', {
		scrollbars: true,
		mouseWheel: true,
		interactiveScrollbars: true,
		shrinkScrollbars: 'scale',
		fadeScrollbars: true
	});
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);

</script>

<!-- 
<script type="text/javascript">
var cusid=GetQueryString("openid");
if(cusid != null){
//weixin/hy/register.jsp?openid=
window.location.href=getIP()+"wxEven/auth.action?brandId=gh_8d5f9c073de7&type=register";
}

</script> -->
</head>
<body onload="loaded()">
<div id="header">隐私政策</div>
<div id="wrapper" style="bottom:0px;">
	<div id="scroller">
	
	<div class="box">
		<span class="sececd_title">更新日期：2015年5月16日</span>
  		<p>
  			广州市诺云科技有限公司（以下简称“云ICU”）重视本公司网站、产品及服务之用户的隐私，并且尽商业上合理的一切努力保护这些隐私。本隐私政 策涉及在您与云ICU互动（例如当您访问本公司网站、使用本公司产品或服务或与云ICU员工交流时）的过程中云ICU可能接触到的个人信息的收集、使用和披露。请阅读下文以详细了解我们收集何种信息、如何处理这些信息以及我们可能如何使用您的个人信息。
  		</p>
		<span class="sececd_title">我们信息收集的范围</span>
		<p>在您使用云ICU服务的过程中,我们可能会收集与您相关的信息。我们收集这些个人信息的主要目的是为了尽可能为您和云ICU的其他用户提供最高水平的服务。我们有两种信息收集方式：</p>
		<span class="thirdTitle">• 您向我们提供信息。</span>
		<p>
			我们的很多服务都要求您注册云ICU帐户。而在您注册云ICU帐户时，我们会要求您提供个人信息，例如您的姓名、电子邮件地址、电话号码或信用卡号。如果您想要充分利用我们提供的各种分享功能，可能还需要创建公开显示的个人资料，其中可能会包含您的姓名、照片和其他的个人信息。在您使用我们服务的过程中，您可能会根据服务的性质向我们提供文字、声音、图片、视频等信息。如果您在云ICU提供的任何互联网服务的工作人员直接或者间接联系提供了个人信息,为更好的向您提供服务我们也会收集和记录您的信息。
		</p>
		<span class="thirdTitle">• 我们在您使用服务的过程中获取信息。</span>
		<p>
			我们会收集关于您使用的服务以及使用方式的信息。此类信息包括：
		</p>
		<span class="thirdTitle">• 设备信息</span>
		<p>我们可能会收集与设备有关的信息，例如您的硬件型号、操作系统版本、唯一设备识别码以及包括电话号码在内的移动网络信息。云ICU可能会将您的设备识别码或电话号码与您的云ICU帐户相关联。</p>
		<span class="thirdTitle">• 日志信息</span>
		<p>
			当您使用我们的服务或查看由云ICU提供的内容时，我们可能会自动收集某些信息并存储到服务器日志中。此类信息包括但不限于：<br/>
				• 您对我们服务的详细使用情况，例如您的搜索查询内容；<br/>
				• IP 地址；<br/>
				• 设备事件信息，例如崩溃、系统活动、硬件设置、浏览器类型、浏览器语言、您提出请求的日期和时间以及引荐网址。<br/>
				• 可唯一标识您的浏览器或云ICU帐户的Cookie。<br/>
<span class="thirdTitle">• 位置信息</span>
当您使用具有定位功能的云ICU服务时，我们可能会收集并处理有关您实际所在位置的信息（例如移动设备发送的 GPS 信号）。我们还可能使用各种技术进行定位，例如来自您设备的传感器数据就可以提供附近 Wi-Fi 接入点和基站的信息。
<span class="thirdTitle"• >唯一应用程序编号</span>
某些服务包含唯一应用程序编号。当您安装或卸载相关服务或当这些服务定期与我们的服务器通信（例如对软件进行自动更新）时，系统会将此编号以及与安装相关的信息（例如操作系统类型和应用程序版本号）发送给云ICU。
<span class="thirdTitle">• 本地存储</span>（包括 HTML 5）和应用程序数据缓存，在您的设备上收集信息（包括个人信息）并进行本地存储。
<span class="thirdTitle">• Cookie 和匿名标识符</span>
当您使用云ICU服务时，我们会使用各种技术来收集和存储信息，在此过程中可能会向您的设备发送一个或多个Cookie 或匿名标识符。当您与我们提供给合作伙伴的服务进行互动时，我们也会使用 Cookie 和匿名标识符。Cookies是您访问过某一网站后可能存储在您硬盘上的小数据文件，通常包括匿名唯一识别符。Cookie无法从您的硬盘上取得任何其他数据、 传播计算机病毒或捕捉您的电子邮件地址。云ICU将Cookies用于用户认证、记录用户偏好、需使用用户身份的推广活动、记录受众规模及流量模式及某些其他目的。我们的电子邮件消息和新闻简报中可能包含跟踪像素，用于确定消息是否被开启以及链接是否确实被查看。


<span class="sececd_title">您对相关信息的自主权</span>
<span class="thirdTitle">您向我们提供的信息</span>
云ICU的注册用户可以登录【www.yunicu.com】 (以下合称为“云ICU网站”)以及应用访问云ICU账户信息页面并点击“设置”链接，随时查看并修改注册内容中的个人信息。您可以随时选择不再参与这些服务和（或）删除您在任何应用上发布的信息和资料。
从云ICU网站或应用登录账户后，您还可以修改联系方式。如果您不希望收到我们的电子邮件推广信函，您可以从我们发给您的电子邮件点击位于底部的“取消订阅”链接。如果您注销账户或删除任何发布的内容，您或访问服务的其他人将无法再访问该等信息，但是由于计算机系统的运行和持续数据备份及存档特性，该等信息的残余副本可能继续存在。
如果云ICU允许您在我公司网站的公开区域或任何其他网站或接收方处发布个人或其他敏感信息，则您应当谨慎考虑是否发布。如果您选择发布的任何个人信息被公布或使用，云ICU概不负责。
<span class="thirdTitle">我们在您使用服务的过程中获取的信息</span>
您可以通过设置您的设备拒绝我们在您使用服务的过程中收集某些信息，例如您可以将您的浏览器设置为接受cookies、拒绝cookies或在使用cookie时通知您。但是，如果您将您的浏览器设置为拒绝 cookies，您可能将无法使用需要您登陆的云ICU产品或服务或利用其全部功能。如果您不希望接收跟踪像素，您需要禁止电子邮件客户端中的HTML图像，但这样可能会影响您查看收到的其他电子邮件中的图片。


<span class="sececd_title">透明度和我们对所收集信息的使用</span>
当您在云ICU网站和应用上访问或发布信息时，即表示您允许云ICU为提供服务之目的而记录、使用该等信息并对其采取其他行动（按适用法律要求和/或如服务条款所述）。通常，云ICU员工并不监控或查看云ICU服务中存储的您的个人信息或内容，但如果我们得知我们的服务条款可能已被违反并且需要对此进行确认，或我们确定我们有义务审查或者向以法律或适用法规所授予权力行事的其他方提供您的个人信息或内容，则您的个人信息或内容可能会被查看。
我们会将收集的信息作以下用途：
1. 就可指向特定个人的信息而言，我们使用这些信息于：
• 运行、维护、处理和管理我们的服务，包括处理登记及付款，并提供客户支持；
• 在日常业务过程中必须的对您本人提出的问题的回答和沟通；• 对您发出有关我们产品的特性、功能、条件或我们的服务的其他方面的公告；及（如适用），通知您我们为您提供的、您可能感兴趣的产品或服务；
• 履行我们的法律义务；
• 在本政策或服务条款中的其他服务。
2. 就不可指向特定个人的信息而言，我们使用这些信息于：
• 创建新的功能和服务；
• 维护我们的服务和保护数据安全；
• 审计、研究、测量和分析，以维持、管理、增强和保护我们的服务，包括分析使用趋势、模式和测量的内容，广告，功能或服务的效能；
• 基于用户相关信息和cookie的自动内容交付，如量身定制的广告或搜索结果；
• 卫生和医学研究，公共卫生和服务活动，医疗保健及医疗相关服务；
• 我们也可能使用非个人信息来为当前或未来的广告商、赞助商和其他合作伙伴准备汇总报告，目的是为了报告一般使用我们服务的用户的总体发展趋势；
• 在本政策或服务条款中的其他服务。
我们不会与他人分享这些信息，亦不会将其出售、出租或以其他方式分发给他人（按照本隐私政策之规定披露的除外）。下列情形下，云ICU可以与外部人士分享您的信息：
• 您明确同意我们分享信息；
• 为了满足您对产品或服务的要求，我们需要分享您的信息；
• 我们希望就来自于业务合作伙伴的产品或服务与您取得联系，除非您点击云ICU电子邮件简报中的取消订阅链接；
• 我们善意地认为，为了遵守我们的法定义务，分享或以其他方式允许访问、披露、使用或保存该等信息是必要的；
• 您明确要求来自于云ICU业务合作伙伴的信息，这种情况下，在收集信息时，收集个人信息方以及其所应适用的隐私声明均将予以明确；
• 我们认为为了履行我们的法律报告义务或为了调查、预防非法活动、涉嫌诈骗行为或对人身或财产的潜在威胁，或对该等情形采取行动，有必要向司法机关或其他有权行政机关披露您的信息；
• 我们认为为了调查和/或披露可能违反我们服务条款的行为或执行这些服务条款，有必要披露您的信息；或
• 您与我们的某一关联方或合作伙伴之间存在线上或线下（非基于互联网）的关系；或曾访问云ICU网站上链接或提及的关联方或合作伙伴网站，并已经通过该合作伙伴或关联方之程序或网站注册云ICU的在线服务，而我们与该关联方或合作伙伴之间亦存在某种关系。


<span class="sececd_title">数据安全</span>
云ICU致力于保护您的信息安全，并为此采取合理的预防措施。但是，互联网数据传输，无论是有线的还是无线的，均无法保证100%的安全，因此我们无法保证您传输给我们的信息绝对安全；因此，您确认，您对传输给我们的信息自担风险。一旦我们收到您的传输的数据，我们将做出一切商业上合理的努力确保其在我们系统上的安全：
• 您的云ICU密码受到加密保护，并且只有您有权修改；• 存储在我们的系统上的您的个人信息及数据受到各种物理、电子和程序措施的保护。它们存储在安全的设施上，并且云ICU将通过物理和网络方式接触该等设备的权限局限在受过严格训练的部分员工，并定期评估其技术、设备、程序及潜在风险，以维护用户数据的安全和隐私；及
• 某些云ICU服务支持使用标准SSL加密以保护数据传输。但是，由于防火墙或其他安全软件可能发生故障，这并不保证该等数据传输不可能被访问、修改或删除。
如果云ICU得知安全系统漏洞，我们可能联络您在注册时提供的电子邮件地址或手机号，并在我们的网站上发布通知，以试图告知您并提供关于保护措施（如适用）的信息。依据您的居住地，您可能依法享有以书面形式接收该等通知的权利。


<span class="sececd_title">链接</span>
云ICU网站及服务可能包含其他网站的链接。对于我们的网站及服务所链接之网站或服务所采用的隐私政策或其他做法，以及该等网站或服务上含有的信息或内容，云ICU概不负责。本隐私声明仅适用于本网站及服务收集的信息。


<span class="sececd_title">修改与更新</span>
由于本隐私政策可能不时被更新，我们将及时在网页顶部显示更新日期。您应定期查看以了解我们保护所收集之个人信息的方案及程序。您继续使用云ICU服务即构成您对本隐私政策及其任何更新版本的同意。
如果云ICU出售其资产，与另一实体合并或申请破产，自本网站收集或在运营服务过程中收集的信息可能作为云ICU资产被转让。


<span class="sececd_title">联系我们</span>
欢迎您对本隐私政策和我们的服务条款提出意见。如有任何问题、意见或疑虑，请发电子邮件至【nuoyuntech@163.com】或寄信至：
广州市诺云科技有限公司，广州市番禺区市桥街环城中路63、65、67、69号梅山大厦三楼整套335（邮编：100022）



<h3>服务条款</h3>
<span class="sececd_title">一、您与云ICU的关系</span>
1.1您对云ICU产品、软件、服务及网站（本文件中合称"服务"，不包括在单独的书面协议项下云ICU向您提供的任何服务）的使用适用您和云ICU之间法律协议的条款。"云ICU"指云广州市诺云科技有限公司，主营业地位于广州市番禺区市桥街环城中路63、65、67、69号梅山大厦三楼整套335。本文件解释了协议如何制定，并陈述了协议中的若干条款。
1.2除非与云ICU另有书面协议，否则您与云ICU的协议将始终至少包括本文件中陈述的条款和条件。这些条款和条件下称"通用条款"。1.3除通用条款外，您与云ICU的协议亦将包括适用于服务的任何法律声明中的条款。所有这些法律声明中的条款下称"额外条款"。额外条款适用于服务时，您可在该服务范围内或使用该服务过程中读到该等条款。
1.4通用条款，连同额外条款，构成您和云ICU之间关于您使用服务的具有法律约束力的协议。您花时间仔细加以阅读是重要的。该法律协议以下合称"本条款"。
1.5如果额外条款的内容和通用条款的内容发生任何冲突，则就该服务内容，应以额外条款为准。


<span class="sececd_title">二、接受本条款</span>
2.1使用服务必须首先同意本条款。如果您不接受本条款则不可使用服务。
2.2您可通过下列方式接受本条款：
(A)在有关任何服务的用户界面上云ICU向您提供的选择处点击以接受或同意本条款；
或(B)实际使用服务。在此情况下，您理解并同意云ICU视您自使用服务时起接受本条款。
2.3在下列情况下您不可使用服务且不能接受本条款：
(a)您未达到与云ICU订立有约束力的合同的法定年龄，或(b)根据中国或其他国家（包括您居住的或您从那里使用服务的国家）的法律，您是被禁止接受服务的人。


<span class="sececd_title">三、本条款语言</span>
3.1云ICU向您提供本条款中文文本的翻译件时，您同意翻译件仅供您方便之用，本条款的中文文本适用于您和云ICU之间的关系。
3.2如果本条款中文文本和翻译文本存在任何冲突，则以中文文本为准。


<span class="sececd_title">四、云ICU提供服务</span>	
4.1云ICU在世界范围内拥有子公司和关联法律实体（"子公司和关联公司"）。在某些时候，这些公司将代表云ICU向您提供服务。您认知并同意子公司和关联公司有权向您提供服务。
4.2云ICU不断创新以向其用户提供最优体验。您认知并同意云ICU提供的服务的形式和本质可不经事先通知您而不时变换。
4.3作为这种持续创新的一部分，您认知并同意云ICU可自行决定，无须事先通知您，即停止（永久或暂时）向您或全体用户提供服务。您可在任何时候停止使用服务。您停止使用服务时无需特别通知云ICU。
4.4您认知并同意，如果云ICU禁用对您的帐户的访问权，则您可能被阻止获得服务、您的帐户资料或包含在您帐户中的任何文件或其他内容。
4.5您认知并同意，尽管云ICU可能目前没有设置您可通过服务发送或接收的传输数量或用于提供任何服务的存储空间的上限，但云ICU可自行决定在任何时候设置上限。


<span class="sececd_title">五、您对服务的使用</span>
5.1为获得某些服务，您可能会被要求提供自身信息（如身份或联系资料）作为服务的登记程序的一部分，或作为您持续使用服务的一部分。您同意您给予云ICU的任何登记信息均是准确、正确和最新的。5.2您同意仅为(a)本条款及(b)任何适用法律、法规或有关辖区内公认的惯例或准则（包括关于数据或软件向或从美国或其他相关国家出口的任何法律）所允许的目的使用服务。
5.3您同意不以通过云ICU提供的界面以外的任何方式获得（或试图获得）任何服务，除非您根据与云ICU的单独协议获得特别允许。
5.4您同意您不从事妨碍或者破坏服务（或与服务连接的服务器及网络）的任何活动。
5.5除非您在与云ICU的单独协议中获得特别允许，否则您同意您不为任何目的再制作、复制、拷贝、出售、交易或转售服务。
5.6您同意独自就您违反您在本条款项下的义务以及任何该等违反的后果（包括云ICU遭受的任何损失或损害）承担责任（云ICU不对您或任何第三方承担责任）。


<span class="sececd_title">六、您的密码和帐户安全</span>
6.1您同意并理解您有责任将您与用于获得服务的任何帐户相关的密码保密。
6.2据此，您同意将独自就在您帐户下的所有活动对云ICU负责。
6.3如果您得知任何对您的密码或您的帐户的任何未经授权的使用，您同意立即通知云ICU。


<span class="sececd_title">七、隐私与您的个人信息</span>
7.1关于云ICU的数据保护惯例的信息，请查阅云ICU的隐私政策。该政策解释了云ICU如何处理您的个人信息，并在您使用服务时保护您的隐私。
7.2您同意按照云ICU的隐私政策使用您的数据。


<span class="sececd_title">八、服务内容</span>
8.1您理解，作为服务的一部分或通过您使用服务得到的所有信息（如数据文件、书面文本、电脑软件、音乐、音像文件或其他声音、图片、录像或其他图像），完全由该内容出处的人员负责。所有该等信息下称"内容"。
8.2您应意识到作为服务一部分展示给您的内容，包括但不限于服务中的广告及服务中的赞助内容，可能受向云ICU提供内容的赞助者或广告商（或代表其的其他人员或公司）所拥有的知识产权的保护。您不得修改、租赁、出租、借贷、出售、分发该内容（无论全部还是部分）或根据该内容创作衍生作品，除非云ICU或内容所有人在单独协议中特别告知您可以为之。
8.3云ICU保留从任何服务中筛选、审阅、标明、过滤、修订、拒绝或删除任何或所有内容的权利（但无义务这样做）。就某些服务而言，云ICU可提供滤除明确色情内容、政治相关内容的工具。此外，还有可以通过商业渠道获得的服务和软件能够限制访问令您反感的材料。
8.4您理解：通过使用服务，您可能会接触到您觉得冒犯的、粗鄙的、反感的内容，您使用服务时与此相关的风险由您自行承担。
8.5您同意独自就您在使用服务时创作、传送或展示的任何内容以及您做出该等行为的后果（包括云ICU可能遭受的任何损失或损害）承担责任（云ICU不对您或任何第三方承担责任）。<span class="sececd_title">九、专有权利</span>
9.1您认知并同意，云ICU（或云ICU的许可方）对服务拥有一切法定权利、所有权和利益，包括存在于服务中的任何知识产权（无论该等权利是否已经登记，也不论该等权利在世界的何等地方存在）。您进一步认知，服务可能包括云ICU指定为保密的信息，未经云ICU事先书面同意，您不得披露该等信息。
9.2除非您与云ICU另有书面协议，否则本条款中的任何规定均未给予您使用云ICU任何商号、商标、服务标记、标识、域名及其他显著品牌特征的权利。
9.3如果您在与云ICU的单独书面协议中被给予一项使用上述品牌特征的明确的权利，则您同意您在使用该等品牌特征时遵守该协议、本条款的任何适用规定以及不时更新的云ICU品牌特征使用指南。
9.4除第11条规定的限制许可外，云ICU认知并同意，其不在本条款项下获得您（或您的许可方）对在服务上或通过服务提交、张贴、传输或展示的任何内容的任何权利、所有权或利益，包括该内容中存在的任何知识产权（无论该等权利是否已经登记，亦不论该等权利在世界的何等地方存在）。除非您与云ICU另有书面协议，否则您同意您负责保护并强制执行这些权利，云ICU没有义务代表您这样做。
9.5您同意您不得删除、掩藏或改动服务所附的或包含的任何专有权利声明（包括著作权和商标声明）。
9.6除非您得到云ICU书面明确授权这样做，否则您同意在使用服务时，您将不以可能或故意导致混淆该等商标、名称或标识的所有者或授权用户的方式使用任何公司或组织的商标、服务标识、商号、标识。


<span class="sececd_title">十、云ICU的许可</span>
10.1云ICU给予您一项个人的、全世界范围内的、不可转让及非排他性的许可，以使用作为云ICU向您所供服务的一部分而向您提供的软件（下称"软件"）。此项许可仅以使您可以根据本条款允许的方式使用和享用云ICU提供的服务的益处为目的。
10.2您不得（且您不得允许任何其他人）拷贝、修改软件或软件的任何部分，或对软件或软件的任何部分创作衍生作品，进行反向工程、反编辑或试图从软件或软件的任何部分提取源代码，但法律明确允许或要求的或云ICU特别书面告知您的除外。
10.3除非云ICU给予您明确的书面允许，否则您不得转让您对软件的使用权（或授予该使用权的分许可）、在您对软件的使用权上设置担保权益或以其他方式转让您对软件的使用权的任何部分。


<span class="sececd_title">十一、您对内容的许可</span>
11.1您保留你在服务上或通过服务提交、张贴或展示的内容中已持有的著作权及任何其他权利。通过提交、张贴或展示内容，您给予云ICU一项永久性的、不可撤销的、世界范围内的、免交使用费的及非排他性的许可，以复制、改编、修改、翻译、发布、公开实施、公开展示及分发您在服务上或通过服务提交、张贴或展示的任何内容。此项许可仅以使云ICU可以展示、分发及宣传服务为目的，并可按某些服务的附加条款就该等服务撤销此项许可。
11.2您同意此项许可包括一项权利，使云ICU可将该等内容提供给与云ICU有提供联合服务的关系的其他公司、组织或个人，并就联合服务的提供使用该内容。
11.3您理解，云ICU在实施所需的技术措施向用户提供服务时，可(a)在不同的公共网络和不同的媒体传送或分发您的内容；(b)对您的内容作出必要的变更以使内容符合、适应连接网络、装置、服务或介质的技术要求。您同意此项许可允许云ICU采取这些行动。
11.4您向云ICU确认并保证您拥有所有必要的权利、权力和授权授予上述许可。<span class="sececd_title">十二、您使用的软件可从云ICU不时地自动下载和安装更新版本</span>
这些更新旨在改进、增强和进一步开发服务并可采用修正版、强化功能、新软件模块和全新版本的形式。您同意接受该等更新（并允许云ICU向您交付）作为您使用服务的一部分。


<span class="sececd_title">十三、终止您与云ICU的关系</span>
13.1本条款将持续适用直至根据下述规定由您或云ICU终止。
13.2如果您希望终止与云ICU的法律协议，您可通过下列方式完成：(a)在任何时候通知云ICU及(b)在云ICU向您提供选择的情况下，关闭您使用的所有服务的帐户。您的通知应书面发送至本条款起始之处规定的云ICU地址。
13.3发生下列情况时云ICU可终止其与您的法律协议：
(A)您违反了本条款的任何规定（或您的行为方式明确显示您不打算或不能遵守本条款规定）；
或(B)法律要求云ICU这样做（例如：向您提供服务不合法或变得不合法）；
或(C)云ICU与之一起向您提供服务的合作伙伴已终止与云ICU的关系或停止向您提供服务；
或(D)云ICU转变为不再向您居住的或您从那里使用服务的国家内的用户提供服务；
或(E)云ICU认为，云ICU向您提供服务不再具有商业可行性。
13.4本条的任何规定不得影响云ICU与根据第4条提供服务有关的权利。
13.5本条款终止时，您和云ICU已经享受或承担的（或在本条款有效期间已经产生的）或明确规定为无限期有效的所有法定权利、义务和责任不受该终止的影响，第20.7条的规定应无限期地适用于该等权利、义务和责任。


<span class="sececd_title">十四、不包括其他保证</span>
14.1本条款中的任何规定，包括第14和第15条，均不排除或限制云ICU根据适用法律不能合法排除或限制的损失保证或责任。某些司法辖区不允许排除某些保证或条件，或限制或排除对由于疏忽、违约、违反暗含条款引起的损失或损害或对附带或后果性损害的责任。因此，只有在您的司法辖区合法的限制对您适用，并且我们的责任将在法律允许的最大限度内受到限制。
14.2您明示理解并同意，您对使用服务独自承担风险并且服务按"现状"和"原样"的方式提供。
14.3尤其是，云ICU、其子公司和关联公司及其许可人，不就以下各项向您作出陈述或保证：
(A)您对服务的使用将符合您的需求；
(B)您对服务的使用将无中断、及时、安全或没有错误；
(C)由于您使用服务而获得的任何信息将是准确的或可靠的；
(D)作为服务的一部分向您提供的任何软件的运行或功能中的缺陷将被纠正。
14.4通过使用服务而下载或以其他方式获得的任何材料由您自行作出并承担风险，您将独自对由于下载任何该等材料而导致对电脑系统或其他装置的损害或数据的丢失负责。
14.5您从云ICU获得的或通过服务或从服务获得的任何建议或信息（无论口头还是书面的）均不创立本条款中未明确规定的任何保证。14.6云ICU进一步明确否认任何种类的所有保证和条件（无论明示还是默示的），包括但不限于适销性、适合特定目的及不侵权的默示保证和条件。


<span class="sececd_title">十五、责任限制</span>
15.1在遵守上文第14.1条全部规定的前提下，您明示理解并同意，云ICU、其子公司和关联公司及其许可人不就以下事项对您承担责任：
(A)您无论由于何种原因和在任何责任理论项下发生的任何直接、间接、附带、特殊、后果性或惩罚性的损害。这应包括但不限于任何利润损失（无论是直接还是间接发生）、任何商誉或业务声誉损失、任何数据丢失、替代物品或服务的购买费用或其他无形损失；
(B)您可能产生的任何损失或损害，包括但不限于由下列原因导致的损失或损害：
(I)您对任何广告的完整性、准确性或其存在的信任， 或作为您与其广告出现在服务中的任何广告商或赞助人之间的任何关系或交易的结果；
(II)云ICU对服务可能做出的变更，或永久或暂时停止提供服务（或服务中的任何功能）；
(III)对通过您使用服务而维持或传输的任何内容及其他通信数据的删除、毁坏或未能将其储存；
(IV)您未向云ICU提供准确的帐户信息；
(V)您未对您的密码或帐户资料保持安全及保密；
15.2无论云ICU是否接到通知或是否应已知晓引起任何该等损失的可能性，上文第15.1条中云ICU对您的责任限制均应适用。


<span class="sececd_title">十六、对关于符合适用国际知识产权法（包括中国的《著作权法》）的指称的著作权侵权通知做出回应以及终止重复侵权者帐户是云ICU的政策。</span>


<span class="sececd_title">十七、广告</span>
17.1部分服务由广告收入支持，可展示广告和推销。这些广告可能是针对存储于服务中的信息、通过服务提出的询问或其它信息的内容提供的。
17.2云ICU在服务上的广告的方式、模式和范围可不经向您特别通知而变更。
17.3作为云ICU授予您访问和使用服务的权利的对价，您同意云ICU可以在服务上加载该等广告。


<span class="sececd_title">十八、其他内容</span>
18.1服务可包含对其他网站或内容或资源的超级链接。云ICU可能并不控制由云ICU以外的公司或个人提供的任何网站或资源。
18.2您认知并同意，云ICU不对该等外部网站或资源的可用性负责，亦不对该等网络或资源上的或从该等网站或资源获得的任何广告、产品或其他材料加以认可。
18.3您认知并同意，云ICU不对由于您由于那些外部的网站或资源的可用性或您对该等网站或资源上的或从该等网站或资源获得的任何广告、产品或其他材料的完整性、准确性或存在的信赖而发生的任何损失或损害承担责任。<span class="sececd_title">十九、本条款的变更</span>
19.1云ICU可不时对通用条款或附加条款作出变更。
19.2您理解并同意，如果您在通用条款或附加条款变更日期之后使用服务，则云ICU将把您的使用视为接受更新后的通用条款或附加条款。


<span class="sececd_title">二十、一般法律条款</span>
20.1有时候您使用服务，您即可（作为您使用服务的结果或通过您对服务的使用）使用其他人或公司提供的某项服务或下载一个其他人或公司提供的软件，或购买其他人或公司提供的商品。您对这些其他服务、软件或商品的使用受限于您和相关公司或个人的单独条款。在此情况下，本条款不影响您和这些其他公司或个人的法律关系。
20.2本条款构成您和云ICU之间关于您使用服务（但不包括根据单独书面协议云ICU向您提供的任何服务）的全部法律协议，并完全取代您和云ICU先前就服务达成的任何协议。
20.3云ICU有义务对您提交的个人信息保密，未经允许不得透露给第三方。您同意云ICU可通过电子邮件发送各种通知及各种非商业或商业性质的内容。
20.4您同意，如果云ICU未行使或未强制执行包含在本条款中的（或云ICU在任何适用法律下有权享受的）任何法定权利或救济，不可视为对云ICU权利的正式放弃，这些权利或救济仍对云ICU有效。
20.5如果对该等事项有司法决定权的任何法院，判定本条款的任何规定无效，则该等规定将从本条款中删除，而不影响本条款的其他部分。本条款的其余部分将继续有效并可强制执行。
20.6您认知并同意，云ICU为母公司的公司集团的每一成员应为本条款的第三方受益人，该等其他公司应有权直接强制执行和依赖赋予其利益（或权利）的本条款的任何规定。此外，没有任何人或公司应是本条款的第三方受益人。
20.7本条款及本条款项下您与云ICU的关系，受中国法律管辖，但排除其冲突法规定。您与云ICU均同意接受位于中国境内的法院的专属管辖权，以解决任何由本条款引起的法律事项。尽管有上述规定，您同意云ICU仍被允许请求任何辖区内的禁制令救济（或同等类型的紧急法定救济）。
<h3>免责声明</h3>
本应用提供的所有的文章、课件、图片、视频及其他资源，若出处为"云ICU"，即为云ICU公司原创或整理，版权归作者与共同所有。若作者有版权声明的或文章从其他网站转载而附带有原所有站的版权声明者，其版权归属以附带声明为准。
云ICU文章仅代表作者本人的观点，与公司立场无关，作者文责自负。
云ICU所刊载的文章、图片及其他资料仅供参考使用，不作为诊断及医疗依据。
本站所刊载的内容，并不代表同意其说法或描述，仅为提供更多信息，也不构成任何学术建议。云ICU不完全保证网站内容的真实性，准确性，完整性，也不保证未来内容不会发生变更。
除特别注明禁止转载的文章外，欢迎公益性网站转载本站资源，但转载时请务必注明出处为"云ICU"，如有可能，请做链接。对于商业性实体，如无本站明确许可，不得非法使用本站资源。
云ICU有权将在本站内发表的文章用于网站的非商业用途，包括网站、电子期刊等，文章有附带版权声明者除外。本站部分资源来自互联网，我们转载的目的是用于学术交流与讨论，如果您认为我们的转载侵犯了您的权益，请与我们联系，我们将尽快采取行动保护您的正当权益。
本网站之声明以及其修改权、更新权及最终解释权均属云ICU所有。

<br>
任何未尽事宜，请与云ICU团队联系：<br>
服务邮箱：nuoyuntech@163.com<br>
寄信至：广州市诺云科技有限公司，广州市番禺区市桥街环城中路63、65、67、69号梅山大厦三楼整套335（邮编：100022）
</div>
	</div>
</div>

<!-- 
<div id="footer">
<div class="agree_tk">
		<input type="checkbox"  name="agree_box" id="agree_box" value=""  />
		<label for="agree_box">我已阅读并同意相关服务条款和隐私政策</label>
		<a name="reg_now" class="reg_now" disabled="disabled" id="register" >立即注册</a>
	</div>
</div> -->

</body>
<script type="text/javascript">
$(function(){
    $("#register").on("click",function(){
    	if($("#agree_box").attr("checked") == "checked"){
    		window.location.href="weixin/hy/registerAdd.jsp";
    	}else{
    		return false;
    	}
    	
    })
    
    $("#agree_box").on("change",function(){
			var regBtn=$(".reg_now");
			var checked=$(this).attr("checked");
			if(checked == "checked")
	  		{
				regBtn.attr("disabled","false").removeClass("active");
				$(this).removeAttr("checked");
				
	  		}
			else
			{
				regBtn.removeAttr("disabled").addClass("active");
				$(this).attr("checked","checked");
				
	  		}
		})
    
})
</script>
</html>
