/// chart : {"result":[{"meta":{"currency":"USD","symbol":"MSFT","exchangeName":"NMS","instrumentType":"EQUITY","firstTradeDate":511108200,"regularMarketTime":1635796802,"gmtoffset":-14400,"timezone":"EDT","exchangeTimezoneName":"America/New_York","regularMarketPrice":329.37,"chartPreviousClose":331.62,"previousClose":331.62,"scale":3,"priceHint":2,"currentTradingPeriod":{"pre":{"timezone":"EDT","end":1635859800,"start":1635840000,"gmtoffset":-14400},"regular":{"timezone":"EDT","end":1635883200,"start":1635859800,"gmtoffset":-14400},"post":{"timezone":"EDT","end":1635897600,"start":1635883200,"gmtoffset":-14400}},"tradingPeriods":[[{"timezone":"EDT","end":1635796800,"start":1635773400,"gmtoffset":-14400}]],"dataGranularity":"1h","range":"1d","validRanges":["1d","5d","1mo","3mo","6mo","1y","2y","5y","10y","ytd","max"]},"timestamp":[1635773400,1635777000,1635780600,1635784200,1635787800,1635791400,1635795000],"indicators":{"quote":[{"volume":[7474157,3825989,2638243,2162336,2268312,2035147,3062601],"high":[331.489990234375,327.8999938964844,328.6300048828125,328.67999267578125,328.3800048828125,328.8699951171875,330.17999267578125],"close":[327.3550109863281,327.6400146484375,328.55999755859375,327.5929870605469,328.2099914550781,328.6300048828125,329.3800048828125],"low":[326.8599853515625,326.3699951171875,327.4049987792969,327.32000732421875,327.4599914550781,328.205810546875,328.3999938964844],"open":[331.3550109863281,327.3299865722656,327.6549987792969,328.55999755859375,327.6000061035156,328.2099914550781,328.6199951171875]}]}}],"error":null}

class StockDetails {
  StockDetails({
      this.chart,});

  StockDetails.fromJson(dynamic json) {
    chart = json['chart'] != null ? Chart.fromJson(json['chart']) : null;

  }
  Chart? chart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (chart != null) {
      map['chart'] = chart?.toJson();
    }
    return map;
  }

}

/// result : [{"meta":{"currency":"USD","symbol":"MSFT","exchangeName":"NMS","instrumentType":"EQUITY","firstTradeDate":511108200,"regularMarketTime":1635796802,"gmtoffset":-14400,"timezone":"EDT","exchangeTimezoneName":"America/New_York","regularMarketPrice":329.37,"chartPreviousClose":331.62,"previousClose":331.62,"scale":3,"priceHint":2,"currentTradingPeriod":{"pre":{"timezone":"EDT","end":1635859800,"start":1635840000,"gmtoffset":-14400},"regular":{"timezone":"EDT","end":1635883200,"start":1635859800,"gmtoffset":-14400},"post":{"timezone":"EDT","end":1635897600,"start":1635883200,"gmtoffset":-14400}},"tradingPeriods":[[{"timezone":"EDT","end":1635796800,"start":1635773400,"gmtoffset":-14400}]],"dataGranularity":"1h","range":"1d","validRanges":["1d","5d","1mo","3mo","6mo","1y","2y","5y","10y","ytd","max"]},"timestamp":[1635773400,1635777000,1635780600,1635784200,1635787800,1635791400,1635795000],"indicators":{"quote":[{"volume":[7474157,3825989,2638243,2162336,2268312,2035147,3062601],"high":[331.489990234375,327.8999938964844,328.6300048828125,328.67999267578125,328.3800048828125,328.8699951171875,330.17999267578125],"close":[327.3550109863281,327.6400146484375,328.55999755859375,327.5929870605469,328.2099914550781,328.6300048828125,329.3800048828125],"low":[326.8599853515625,326.3699951171875,327.4049987792969,327.32000732421875,327.4599914550781,328.205810546875,328.3999938964844],"open":[331.3550109863281,327.3299865722656,327.6549987792969,328.55999755859375,327.6000061035156,328.2099914550781,328.6199951171875]}]}}]
/// error : null

class Chart {
  Chart({
      this.result, 
      this.error,});

  Chart.fromJson(dynamic json) {
    if (json['result'] != null) {

      result = [];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
    error = json['error'];
  }
  List<Result>? result;
  dynamic error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['error'] = error;
    return map;
  }

}

/// meta : {"currency":"USD","symbol":"MSFT","exchangeName":"NMS","instrumentType":"EQUITY","firstTradeDate":511108200,"regularMarketTime":1635796802,"gmtoffset":-14400,"timezone":"EDT","exchangeTimezoneName":"America/New_York","regularMarketPrice":329.37,"chartPreviousClose":331.62,"previousClose":331.62,"scale":3,"priceHint":2,"currentTradingPeriod":{"pre":{"timezone":"EDT","end":1635859800,"start":1635840000,"gmtoffset":-14400},"regular":{"timezone":"EDT","end":1635883200,"start":1635859800,"gmtoffset":-14400},"post":{"timezone":"EDT","end":1635897600,"start":1635883200,"gmtoffset":-14400}},"tradingPeriods":[[{"timezone":"EDT","end":1635796800,"start":1635773400,"gmtoffset":-14400}]],"dataGranularity":"1h","range":"1d","validRanges":["1d","5d","1mo","3mo","6mo","1y","2y","5y","10y","ytd","max"]}
/// timestamp : [1635773400,1635777000,1635780600,1635784200,1635787800,1635791400,1635795000]
/// indicators : {"quote":[{"volume":[7474157,3825989,2638243,2162336,2268312,2035147,3062601],"high":[331.489990234375,327.8999938964844,328.6300048828125,328.67999267578125,328.3800048828125,328.8699951171875,330.17999267578125],"close":[327.3550109863281,327.6400146484375,328.55999755859375,327.5929870605469,328.2099914550781,328.6300048828125,329.3800048828125],"low":[326.8599853515625,326.3699951171875,327.4049987792969,327.32000732421875,327.4599914550781,328.205810546875,328.3999938964844],"open":[331.3550109863281,327.3299865722656,327.6549987792969,328.55999755859375,327.6000061035156,328.2099914550781,328.6199951171875]}]}

class Result {
  Result({
      this.meta, 
      this.timestamp, 
      this.indicators,});

  Result.fromJson(dynamic json) {

    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;

    timestamp = json['timestamp'] != null ? json['timestamp'].cast<int>() : [];
    indicators = json['indicators'] != null ? Indicators.fromJson(json['indicators']) : null;
  }
  Meta? meta;
  List<int>? timestamp;
  Indicators? indicators;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['timestamp'] = timestamp;
    if (indicators != null) {
      map['indicators'] = indicators?.toJson();
    }
    return map;
  }

}

/// quote : [{"volume":[7474157,3825989,2638243,2162336,2268312,2035147,3062601],"high":[331.489990234375,327.8999938964844,328.6300048828125,328.67999267578125,328.3800048828125,328.8699951171875,330.17999267578125],"close":[327.3550109863281,327.6400146484375,328.55999755859375,327.5929870605469,328.2099914550781,328.6300048828125,329.3800048828125],"low":[326.8599853515625,326.3699951171875,327.4049987792969,327.32000732421875,327.4599914550781,328.205810546875,328.3999938964844],"open":[331.3550109863281,327.3299865722656,327.6549987792969,328.55999755859375,327.6000061035156,328.2099914550781,328.6199951171875]}]

class Indicators {
  Indicators({
      this.quote,});

  Indicators.fromJson(dynamic json) {

    if (json['quote'] != null) {
      quote = [];
      json['quote'].forEach((v) {
        quote?.add(Quote.fromJson(v));
      });
    }
  }
  List<Quote>? quote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (quote != null) {
      map['quote'] = quote?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// volume : [7474157,3825989,2638243,2162336,2268312,2035147,3062601]
/// high : [331.489990234375,327.8999938964844,328.6300048828125,328.67999267578125,328.3800048828125,328.8699951171875,330.17999267578125]
/// close : [327.3550109863281,327.6400146484375,328.55999755859375,327.5929870605469,328.2099914550781,328.6300048828125,329.3800048828125]
/// low : [326.8599853515625,326.3699951171875,327.4049987792969,327.32000732421875,327.4599914550781,328.205810546875,328.3999938964844]
/// open : [331.3550109863281,327.3299865722656,327.6549987792969,328.55999755859375,327.6000061035156,328.2099914550781,328.6199951171875]

class Quote {
  Quote({
      this.volume, 
      this.high, 
      this.close, 
      this.low, 
      this.open,});

  Quote.fromJson(dynamic json) {
    volume = json['volume'] != null ? json['volume'].cast<int>() : [];
    high = json['high'] != null ? json['high'].cast<double>() : [];
    close = json['close'] != null ? json['close'].cast<double>() : [];
    low = json['low'] != null ? json['low'].cast<double>() : [];
    open = json['open'] != null ? json['open'].cast<double>() : [];
  }
  List<int>? volume;
  List<double>? high;
  List<double>? close;
  List<double>? low;
  List<double>? open;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['volume'] = volume;
    map['high'] = high;
    map['close'] = close;
    map['low'] = low;
    map['open'] = open;
    return map;
  }

}

/// currency : "USD"
/// symbol : "MSFT"
/// exchangeName : "NMS"
/// instrumentType : "EQUITY"
/// firstTradeDate : 511108200
/// regularMarketTime : 1635796802
/// gmtoffset : -14400
/// timezone : "EDT"
/// exchangeTimezoneName : "America/New_York"
/// regularMarketPrice : 329.37
/// chartPreviousClose : 331.62
/// previousClose : 331.62
/// scale : 3
/// priceHint : 2
/// currentTradingPeriod : {"pre":{"timezone":"EDT","end":1635859800,"start":1635840000,"gmtoffset":-14400},"regular":{"timezone":"EDT","end":1635883200,"start":1635859800,"gmtoffset":-14400},"post":{"timezone":"EDT","end":1635897600,"start":1635883200,"gmtoffset":-14400}}
/// tradingPeriods : [[{"timezone":"EDT","end":1635796800,"start":1635773400,"gmtoffset":-14400}]]
/// dataGranularity : "1h"
/// range : "1d"
/// validRanges : ["1d","5d","1mo","3mo","6mo","1y","2y","5y","10y","ytd","max"]

class Meta {
  Meta({
      this.currency, 
      this.symbol, 
      this.exchangeName, 
      this.instrumentType, 
      this.firstTradeDate, 
      this.regularMarketTime, 
      this.gmtoffset, 
      this.timezone, 
      this.exchangeTimezoneName, 
      this.regularMarketPrice, 
      this.chartPreviousClose, 
      this.previousClose, 
      this.scale, 
      this.priceHint, 
      this.currentTradingPeriod, 
      this.tradingPeriods, 
      this.dataGranularity, 
      this.range, 
      this.validRanges,});

  Meta.fromJson(dynamic json) {
    currency = json['currency'];
    symbol = json['symbol'];
    exchangeName = json['exchangeName'];
    instrumentType = json['instrumentType'];
    firstTradeDate = json['firstTradeDate'];
    regularMarketTime = json['regularMarketTime'];
    gmtoffset = json['gmtoffset'];
    timezone = json['timezone'];
    exchangeTimezoneName = json['exchangeTimezoneName'];
    regularMarketPrice = json['regularMarketPrice'];
    chartPreviousClose = json['chartPreviousClose'];
    previousClose = json['previousClose'];
    scale = json['scale'];
    priceHint = json['priceHint'];

    currentTradingPeriod = json['currentTradingPeriod'] != null ? CurrentTradingPeriod.fromJson(json['currentTradingPeriod']) : null;

    if (json['tradingPeriods'] != null) {
      tradingPeriods = [];
      json['tradingPeriods'].forEach((v) {
        for(var x in v)
          {
            List<TradingPeriods> trp = [];
            var y = TradingPeriods.fromJson(x);
            trp.add(y);
            tradingPeriods?.add(trp);
          }
      });
    }
    dataGranularity = json['dataGranularity'];
    range = json['range'];
    validRanges = json['validRanges'] != null ? json['validRanges'].cast<String>() : [];
  }
  String? currency;
  String? symbol;
  String? exchangeName;
  String? instrumentType;
  int? firstTradeDate;
  int? regularMarketTime;
  int? gmtoffset;
  String? timezone;
  String? exchangeTimezoneName;
  double? regularMarketPrice;
  double? chartPreviousClose;
  double? previousClose;
  int? scale;
  int? priceHint;
  CurrentTradingPeriod? currentTradingPeriod;
  List<List<TradingPeriods>>? tradingPeriods;
  String? dataGranularity;
  String? range;
  List<String>? validRanges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency'] = currency;
    map['symbol'] = symbol;
    map['exchangeName'] = exchangeName;
    map['instrumentType'] = instrumentType;
    map['firstTradeDate'] = firstTradeDate;
    map['regularMarketTime'] = regularMarketTime;
    map['gmtoffset'] = gmtoffset;
    map['timezone'] = timezone;
    map['exchangeTimezoneName'] = exchangeTimezoneName;
    map['regularMarketPrice'] = regularMarketPrice;
    map['chartPreviousClose'] = chartPreviousClose;
    map['previousClose'] = previousClose;
    map['scale'] = scale;
    map['priceHint'] = priceHint;
    if (currentTradingPeriod != null) {
      map['currentTradingPeriod'] = currentTradingPeriod?.toJson();
    }
    if (tradingPeriods != null) {
      map['tradingPeriods'] = tradingPeriods?.map((v) => v.map((x)=>x.toJson()).toList()).toList();
    }
    map['dataGranularity'] = dataGranularity;
    map['range'] = range;
    map['validRanges'] = validRanges;
    return map;
  }

}

/// timezone : "EDT"
/// end : 1635796800
/// start : 1635773400
/// gmtoffset : -14400

class TradingPeriods {
  TradingPeriods({
      this.timezone, 
      this.end, 
      this.start, 
      this.gmtoffset,});

  TradingPeriods.fromJson(dynamic json) {
    timezone = json['timezone'];
    end = json['end'];
    start = json['start'];
    gmtoffset = json['gmtoffset'];
  }
  String? timezone;
  int? end;
  int? start;
  int? gmtoffset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timezone'] = timezone;
    map['end'] = end;
    map['start'] = start;
    map['gmtoffset'] = gmtoffset;
    return map;
  }

}

/// pre : {"timezone":"EDT","end":1635859800,"start":1635840000,"gmtoffset":-14400}
/// regular : {"timezone":"EDT","end":1635883200,"start":1635859800,"gmtoffset":-14400}
/// post : {"timezone":"EDT","end":1635897600,"start":1635883200,"gmtoffset":-14400}

class CurrentTradingPeriod {
  CurrentTradingPeriod({
      this.pre, 
      this.regular, 
      this.post,});

  CurrentTradingPeriod.fromJson(dynamic json) {
    pre = json['pre'] != null ? Pre.fromJson(json['pre']) : null;
    regular = json['regular'] != null ? Regular.fromJson(json['regular']) : null;
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
  }
  Pre? pre;
  Regular? regular;
  Post? post;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pre != null) {
      map['pre'] = pre?.toJson();
    }
    if (regular != null) {
      map['regular'] = regular?.toJson();
    }
    if (post != null) {
      map['post'] = post?.toJson();
    }
    return map;
  }

}

/// timezone : "EDT"
/// end : 1635897600
/// start : 1635883200
/// gmtoffset : -14400

class Post {
  Post({
      this.timezone, 
      this.end, 
      this.start, 
      this.gmtoffset,});

  Post.fromJson(dynamic json) {
    timezone = json['timezone'];
    end = json['end'];
    start = json['start'];
    gmtoffset = json['gmtoffset'];
  }
  String? timezone;
  int? end;
  int? start;
  int? gmtoffset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timezone'] = timezone;
    map['end'] = end;
    map['start'] = start;
    map['gmtoffset'] = gmtoffset;
    return map;
  }

}

/// timezone : "EDT"
/// end : 1635883200
/// start : 1635859800
/// gmtoffset : -14400

class Regular {
  Regular({
      this.timezone, 
      this.end, 
      this.start, 
      this.gmtoffset,});

  Regular.fromJson(dynamic json) {
    timezone = json['timezone'];
    end = json['end'];
    start = json['start'];
    gmtoffset = json['gmtoffset'];
  }
  String? timezone;
  int? end;
  int? start;
  int? gmtoffset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timezone'] = timezone;
    map['end'] = end;
    map['start'] = start;
    map['gmtoffset'] = gmtoffset;
    return map;
  }

}

/// timezone : "EDT"
/// end : 1635859800
/// start : 1635840000
/// gmtoffset : -14400

class Pre {
  Pre({
      this.timezone, 
      this.end, 
      this.start, 
      this.gmtoffset,});

  Pre.fromJson(dynamic json) {
    timezone = json['timezone'];
    end = json['end'];
    start = json['start'];
    gmtoffset = json['gmtoffset'];
  }
  String? timezone;
  int? end;
  int? start;
  int? gmtoffset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timezone'] = timezone;
    map['end'] = end;
    map['start'] = start;
    map['gmtoffset'] = gmtoffset;
    return map;
  }

}