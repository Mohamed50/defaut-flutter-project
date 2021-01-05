import '../../provider/language-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TranslatableText extends StatelessWidget {
  final String text;
  final String pre;
  final String after;
  final TextStyle style;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;

  const TranslatableText(this.text,{Key key, this.style, this.textDirection, this.textAlign, this.maxLines, this.pre : "", this.after : "", this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<LanguageProvider,Map>(
      selector: (context, provider) => provider.localizedValues,
      builder: (context, localizedValues, child) => Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Text(
          pre + (localizedValues == null || localizedValues[text] == null ? text : localizedValues[text]) + after,
          style: style,
          textDirection: textDirection,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
        ),
      ),
    );
  }
}

class JSONTranslatableText extends StatelessWidget {
  final String textAr;
  final String textEn;
  final TextStyle style;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;

  const JSONTranslatableText({Key key, this.style, this.textDirection, this.textAlign, this.maxLines, this.textAr, this.textEn, this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<LanguageProvider,Locale>(
      selector: (context, provider) => provider.locale,
      builder: (context, locale, child) => Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Text(
          locale.languageCode == "en" ? textEn : (textAr ?? textEn),
          style: style,
          textDirection: textDirection,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
        ),
      ),
    );
  }
}
