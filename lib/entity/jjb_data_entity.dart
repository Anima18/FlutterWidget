class JjbDataEntity {
	String result;
	JjbDataData data;
	String info;

	JjbDataEntity({this.result, this.data, this.info});

	JjbDataEntity.fromJson(Map<String, dynamic> json) {
		result = json['result'];
		data = (json['data'] != null && json['data'] != "") ? new JjbDataData.fromJson(json['data']) : null;
		info = json['info'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['result'] = this.result;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['info'] = this.info;
		return data;
	}
}

class JjbDataData {
	int startRow;
	List<int> navigatepageNums;
	int prePage;
	bool hasNextPage;
	int nextPage;
	int pageSize;
	int endRow;
	List<JjbDataDataList> xList;
	int pageNum;
	int navigatePages;
	int total;
	int navigateFirstPage;
	int pages;
	int size;
	bool isLastPage;
	bool hasPreviousPage;
	int navigateLastPage;
	bool isFirstPage;

	JjbDataData({this.startRow, this.navigatepageNums, this.prePage, this.hasNextPage, this.nextPage, this.pageSize, this.endRow, this.xList, this.pageNum, this.navigatePages, this.total, this.navigateFirstPage, this.pages, this.size, this.isLastPage, this.hasPreviousPage, this.navigateLastPage, this.isFirstPage});

	JjbDataData.fromJson(Map<String, dynamic> json) {
		startRow = json['startRow'];
		navigatepageNums = json['navigatepageNums']?.cast<int>();
		prePage = json['prePage'];
		hasNextPage = json['hasNextPage'];
		nextPage = json['nextPage'];
		pageSize = json['pageSize'];
		endRow = json['endRow'];
		if (json['list'] != null) {
			xList = new List<JjbDataDataList>();(json['list'] as List).forEach((v) { xList.add(new JjbDataDataList.fromJson(v)); });
		}
		pageNum = json['pageNum'];
		navigatePages = json['navigatePages'];
		total = json['total'];
		navigateFirstPage = json['navigateFirstPage'];
		pages = json['pages'];
		size = json['size'];
		isLastPage = json['isLastPage'];
		hasPreviousPage = json['hasPreviousPage'];
		navigateLastPage = json['navigateLastPage'];
		isFirstPage = json['isFirstPage'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['startRow'] = this.startRow;
		data['navigatepageNums'] = this.navigatepageNums;
		data['prePage'] = this.prePage;
		data['hasNextPage'] = this.hasNextPage;
		data['nextPage'] = this.nextPage;
		data['pageSize'] = this.pageSize;
		data['endRow'] = this.endRow;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['pageNum'] = this.pageNum;
		data['navigatePages'] = this.navigatePages;
		data['total'] = this.total;
		data['navigateFirstPage'] = this.navigateFirstPage;
		data['pages'] = this.pages;
		data['size'] = this.size;
		data['isLastPage'] = this.isLastPage;
		data['hasPreviousPage'] = this.hasPreviousPage;
		data['navigateLastPage'] = this.navigateLastPage;
		data['isFirstPage'] = this.isFirstPage;
		return data;
	}
}

class JjbDataDataList {
	String jbpeople;
	String statusconfirm;
	dynamic description;
	dynamic banhuihoujiaodai;
	String gangweiCode;
	String utdtguid;
	String banciFname;
	String utdtversion;
	dynamic deviceunitFcode;
	dynamic deviceunitFname;
	String equipments;
	String lrpeople;
	String mdate;
	String banciFcode;
	String zhiciFcode;
	String dbpeople;
	dynamic banhuiqianjiaodai;
	String jbtime;
	String extendparam;
	String lrtime;
	String zhiciFname;
	dynamic updateversion;

	JjbDataDataList({this.jbpeople, this.statusconfirm, this.description, this.banhuihoujiaodai, this.gangweiCode, this.utdtguid, this.banciFname, this.utdtversion, this.deviceunitFcode, this.deviceunitFname, this.equipments, this.lrpeople, this.mdate, this.banciFcode, this.zhiciFcode, this.dbpeople, this.banhuiqianjiaodai, this.jbtime, this.extendparam, this.lrtime, this.zhiciFname, this.updateversion});

	JjbDataDataList.fromJson(Map<String, dynamic> json) {
		jbpeople = json['jbpeople'];
		statusconfirm = json['statusconfirm'];
		description = json['description'];
		banhuihoujiaodai = json['banhuihoujiaodai'];
		gangweiCode = json['gangweiCode'];
		utdtguid = json['utdtguid'];
		banciFname = json['banciFname'];
		utdtversion = json['utdtversion'];
		deviceunitFcode = json['deviceunitFcode'];
		deviceunitFname = json['deviceunitFname'];
		equipments = json['equipments'];
		lrpeople = json['lrpeople'];
		mdate = json['mdate'];
		banciFcode = json['banciFcode'];
		zhiciFcode = json['zhiciFcode'];
		dbpeople = json['dbpeople'];
		banhuiqianjiaodai = json['banhuiqianjiaodai'];
		jbtime = json['jbtime'];
		extendparam = json['extendparam'];
		lrtime = json['lrtime'];
		zhiciFname = json['zhiciFname'];
		updateversion = json['updateversion'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['jbpeople'] = this.jbpeople;
		data['statusconfirm'] = this.statusconfirm;
		data['description'] = this.description;
		data['banhuihoujiaodai'] = this.banhuihoujiaodai;
		data['gangweiCode'] = this.gangweiCode;
		data['utdtguid'] = this.utdtguid;
		data['banciFname'] = this.banciFname;
		data['utdtversion'] = this.utdtversion;
		data['deviceunitFcode'] = this.deviceunitFcode;
		data['deviceunitFname'] = this.deviceunitFname;
		data['equipments'] = this.equipments;
		data['lrpeople'] = this.lrpeople;
		data['mdate'] = this.mdate;
		data['banciFcode'] = this.banciFcode;
		data['zhiciFcode'] = this.zhiciFcode;
		data['dbpeople'] = this.dbpeople;
		data['banhuiqianjiaodai'] = this.banhuiqianjiaodai;
		data['jbtime'] = this.jbtime;
		data['extendparam'] = this.extendparam;
		data['lrtime'] = this.lrtime;
		data['zhiciFname'] = this.zhiciFname;
		data['updateversion'] = this.updateversion;
		return data;
	}
}
