import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GeminiAgentPage()));
}

class GeminiAgentPage extends StatefulWidget {
  @override
  State<GeminiAgentPage> createState() => _GeminiAgentPageState();
}

class _GeminiAgentPageState extends State<GeminiAgentPage> {
  final TextEditingController _controller = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _generateAndNavigate() async {
    final prompt = _controller.text.trim();
    if (prompt.isEmpty) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final apiKey = 'AIzaSyDBkM-1aqDq_lc7FV1ASxbuUVI-RzEhwbM'; // Replace with your key
      final url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent'
      );

      final headers = {
        'Content-Type': 'application/json',
        'X-goog-api-key': apiKey,
      };

final body = jsonEncode({
  "contents": [
    {
      "parts": [
        {
          "text":
          "Output only JSON. Create a Flutter UI based on: \"$prompt\". "
          "Use this schema: {\"type\":\"Column\",\"children\":["
          "{\"type\":\"Text\",\"text\":\"Title\",\"fontSize\":24,\"weight\":\"bold\"},"
          "{\"type\":\"TextField\",\"label\":\"Name\",\"placeholder\":\"Enter your name\"},"
          "{\"type\":\"ElevatedButton\",\"text\":\"Submit\"}"
          "]}. "
          "Use 'text' key for Text, ElevatedButton, and Button labels. "
          "Available widget types: Column, Row, Text, TextField, Slider, Switch, "
          "Checkbox, Radio, Image, Button, ElevatedButton, Icon, Divider, Spacer, "
          "Card, Container, ListView, GridView, DropdownButton. "
          "Include properties like padding, margin, color, backgroundColor, etc."
        }
      ]
    }
  ]
});


      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final text = data['candidates'][0]['content']['parts'][0]['text'];
         print("👉 my prompt: $prompt");
        print("👉 Gemini output: $text");

        final cleanedJson = extractJson(text);
        try{
        final jsonData = jsonDecode(cleanedJson);

        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DynamicUIPage(jsonData: jsonData),
          ),
        );
        } catch (e) {
          setState(() {
            _error = "Invalid JSON format: $cleanedJson\nError: $e";
          });
        }
      } else {
        setState(() {
          _error = "Failed: ${response.statusCode}\n${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _error = "Error: $e";
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  String extractJson(String text) {
    final start = text.indexOf('{');
    final end = text.lastIndexOf('}');
    if (start != -1 && end != -1 && end > start) {
      return text.substring(start, end + 1);
    }
    return '{}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gemini Agent UI")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Describe UI (e.g. 'Login form with email, password and submit button')",
                border: OutlineInputBorder(),
              ),
              minLines: 3,
              maxLines: 6,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _generateAndNavigate,
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : Text("Create UI with Gemini"),
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(_error!, style: TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}

class DynamicUIPage extends StatefulWidget {
  final dynamic jsonData;

  const DynamicUIPage({super.key, required this.jsonData});

  @override
  State<DynamicUIPage> createState() => _DynamicUIPageState();
}

class _DynamicUIPageState extends State<DynamicUIPage> {
  Map<String, dynamic> stateValues = {};
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generated UI"),
        actions: [
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => _showJson(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: buildWidget(widget.jsonData),
        ),
      ),
    );
  }
void _showJson(BuildContext context) {

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Generated Dart Code"),
      content: SingleChildScrollView(
        child: SelectableText(
          JsonEncoder.withIndent('  ').convert(widget.jsonData),
          style: TextStyle(fontFamily: 'monospace'),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
      ],
    ),
  );
}



Color? _parseColor(String? val) {
  if (val == null) return null;
  if (val.startsWith('#')) {
    final hex = val.substring(1);
    return Color(int.parse(hex, radix: 16) + (hex.length == 6 ? 0xFF000000 : 0x00000000));
  }
  switch (val.toLowerCase()) {
    case 'red': return Colors.red;
    case 'green': return Colors.green;
    case 'blue': return Colors.blue;
    case 'yellow': return Colors.yellow;
    case 'black': return Colors.black;
    case 'white': return Colors.white;
    case 'grey': return Colors.grey;
    case 'purple': return Colors.purple;
    case 'orange': return Colors.orange;
    case 'pink': return Colors.pink;
    default: return null;
  }
}


  FontWeight? _parseFontWeight(String? weight) {
    switch (weight?.toLowerCase()) {
      case 'bold': return FontWeight.bold;
      case 'w100': return FontWeight.w100;
      case 'w200': return FontWeight.w200;
      case 'w300': return FontWeight.w300;
      case 'w400': return FontWeight.w400;
      case 'w500': return FontWeight.w500;
      case 'w600': return FontWeight.w600;
      case 'w700': return FontWeight.w700;
      case 'w800': return FontWeight.w800;
      case 'w900': return FontWeight.w900;
      default: return null;
    }
  }

EdgeInsets? _parseEdgeInsets(dynamic val) {
  if (val is List && val.length == 4) {
    return EdgeInsets.fromLTRB(
      (val[0] ?? 0).toDouble(),
      (val[1] ?? 0).toDouble(),
      (val[2] ?? 0).toDouble(),
      (val[3] ?? 0).toDouble(),
    );
  } else if (val is Map) {
    return EdgeInsets.only(
      left: (val['left'] ?? 0).toDouble(),
      top: (val['top'] ?? 0).toDouble(),
      right: (val['right'] ?? 0).toDouble(),
      bottom: (val['bottom'] ?? 0).toDouble(),
    );
  } else if (val is num) {
    return EdgeInsets.all(val.toDouble());
  }
  return null;
}


  BorderRadius? _parseBorderRadius(dynamic val) {
    if (val is num) {
      return BorderRadius.circular(val.toDouble());
    } else if (val is Map) {
      return BorderRadius.only(
        topLeft: Radius.circular((val['topLeft'] ?? 0).toDouble()),
        topRight: Radius.circular((val['topRight'] ?? 0).toDouble()),
        bottomLeft: Radius.circular((val['bottomLeft'] ?? 0).toDouble()),
        bottomRight: Radius.circular((val['bottomRight'] ?? 0).toDouble()),
      );
    }
    return null;
  }

  Alignment? _parseAlignment(String? align) {
    switch (align?.toLowerCase()) {
      case 'center': return Alignment.center;
      case 'centerleft': return Alignment.centerLeft;
      case 'centerright': return Alignment.centerRight;
      case 'topleft': return Alignment.topLeft;
      case 'topcenter': return Alignment.topCenter;
      case 'topright': return Alignment.topRight;
      case 'bottomleft': return Alignment.bottomLeft;
      case 'bottomcenter': return Alignment.bottomCenter;
      case 'bottomright': return Alignment.bottomRight;
      default: return null;
    }
  }

  MainAxisAlignment? _parseMainAxisAlignment(String? align) {
    switch (align?.toLowerCase()) {
      case 'start': return MainAxisAlignment.start;
      case 'end': return MainAxisAlignment.end;
      case 'center': return MainAxisAlignment.center;
      case 'spacebetween': return MainAxisAlignment.spaceBetween;
      case 'spacearound': return MainAxisAlignment.spaceAround;
      case 'spaceevenly': return MainAxisAlignment.spaceEvenly;
      default: return null;
    }
  }

  CrossAxisAlignment? _parseCrossAxisAlignment(String? align) {
    switch (align?.toLowerCase()) {
      case 'start': return CrossAxisAlignment.start;
      case 'end': return CrossAxisAlignment.end;
      case 'center': return CrossAxisAlignment.center;
      case 'stretch': return CrossAxisAlignment.stretch;
      case 'baseline': return CrossAxisAlignment.baseline;
      default: return null;
    }
  }

  Widget buildWidget(dynamic node) {
    if (node == null || node is! Map) return SizedBox.shrink();

    final type = node['type']?.toString()?.toLowerCase();
    final children = (node['children'] ?? []) as List;
    final key = node['key']?.toString();
Map<String, TextEditingController> controllers = {};





    // Common properties
    final padding = _parseEdgeInsets(node['padding']);
    final margin = _parseEdgeInsets(node['margin']);
    final borderRadius = _parseBorderRadius(node['borderRadius']);

    double? _parseDimension(dynamic val) {
      if (val == null) return null;
      if (val == 'infinity') return double.infinity;
      if (val is num) return val.toDouble();
      return null;
    }

Color? bgColor = _parseColor(node['backgroundColor']);
    // if (bgColor == null && node['color'] != null) {
    //   bgColor = _parseColor(node['color']);
    // } 
final width = _parseDimension(node['width']);
final height = _parseDimension(node['height']);


    final alignment = _parseAlignment(node['alignment']);
    final visible = node['visible'] ?? true;

    if (visible == false) return SizedBox.shrink();

    Widget core;

    switch (type) {
      case 'column':
        core = Column(
          mainAxisAlignment: _parseMainAxisAlignment(node['mainAxisAlignment']) ?? MainAxisAlignment.start,
          crossAxisAlignment: _parseCrossAxisAlignment(node['crossAxisAlignment']) ?? CrossAxisAlignment.center,
          mainAxisSize: (node['mainAxisSize'] == 'min') ? MainAxisSize.min : MainAxisSize.max,
          children: children.map((child) => buildWidget(child)).toList(),
        );
        break;

      case 'row':
        core = Row(
          mainAxisAlignment: _parseMainAxisAlignment(node['mainAxisAlignment']) ?? MainAxisAlignment.start,
          crossAxisAlignment: _parseCrossAxisAlignment(node['crossAxisAlignment']) ?? CrossAxisAlignment.center,
          mainAxisSize: (node['mainAxisSize'] == 'min') ? MainAxisSize.min : MainAxisSize.max,
          children: children.map((child) => buildWidget(child)).toList(),
        );
        break;

      case 'text':
  core = Text(
    node['text']?.toString() 
    ?? node['data']?.toString() 
    ?? '',
          style: TextStyle(
            fontSize: (node['fontSize'] ?? 16).toDouble(),
            fontWeight: _parseFontWeight(node['weight'] ?? node['fontWeight'])
                ?? FontWeight.normal, // Default to normal if not specified
            color: _parseColor(node['color']),
            fontStyle: (node['italic'] == true) ? FontStyle.italic : FontStyle.normal,
            decoration: (node['underline'] == true) ? TextDecoration.underline : TextDecoration.none,
          ),
          textAlign: _parseTextAlign(node['textAlign']),
          maxLines: node['maxLines'],
          overflow: (node['ellipsis'] == true) ? TextOverflow.ellipsis : TextOverflow.clip,
        );
        break;

      case 'textfield':
        final fieldKey = key ?? 'textfield_${node['label']}';
        core = TextField(
          key: Key(fieldKey),
     controller: controllers.putIfAbsent(fieldKey, () =>
    TextEditingController(text: stateValues[fieldKey]?.toString())),
          decoration: InputDecoration(
            labelText: node['label']?.toString(),
            hintText: node['placeholder']?.toString(),
            filled: node['filled'] ?? true,
            fillColor: _parseColor(node['fillColor']) ?? Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
            prefixIcon: node['prefixIcon'] != null ? Icon(_parseIcon(node['prefixIcon'])) : null,
            suffixIcon: node['suffixIcon'] != null ? Icon(_parseIcon(node['suffixIcon'])) : null,
          ),
          obscureText: node['obscureText'] ?? false,
          keyboardType: _parseKeyboardType(node['keyboardType']),
          onChanged: (val) {
            setState(() {
              stateValues[fieldKey] = val;
            });
          },
        );
        break;

      case 'slider':
        final sliderKey = key ?? 'slider_${node['label']}';
        final value = (stateValues[sliderKey] ?? node['value'] ?? 0.5).toDouble();
        core = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (node['label'] != null) 
              Text(node['label']?.toString() ?? '',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: value,
              min: (node['min'] ?? 0.0).toDouble(),
              max: (node['max'] ?? 1.0).toDouble(),
              divisions: node['divisions'],
              label: node['showLabel'] == true ? value.toStringAsFixed(2) : null,
              onChanged: (newVal) => setState(() {
                stateValues[sliderKey] = newVal;
              }),
            ),
          ],
        );
        break;

      case 'switch':
        final switchKey = key ?? 'switch_${node['label']}';
        final value = stateValues[switchKey] ?? node['value'] ?? false;
        core = Row(
          children: [
            if (node['label'] != null) 
              Expanded(child: Text(node['label']?.toString() ?? '')),
            Switch(
              value: value,
              onChanged: (newVal) => setState(() {
                stateValues[switchKey] = newVal;
              }),
            ),
          ],
        );
        break;

      case 'checkbox':
        final checkboxKey = key ?? 'checkbox_${node['label']}';
        final value = stateValues[checkboxKey] ?? node['value'] ?? false;
        core = Row(
          children: [
            Checkbox(
              value: value,
              onChanged: (newVal) => setState(() {
                stateValues[checkboxKey] = newVal;
              }),
            ),
            if (node['label'] != null) 
              Text(node['label']?.toString() ?? ''),
          ],
        );
        break;

      case 'radio':
        final groupValue = node['groupValue']?.toString() ?? 'group';
        final radioKey = key ?? 'radio_${node['value']}';
        core = Row(
          children: [
            Radio<String>(
              value: node['value']?.toString() ?? 'option',
              groupValue: stateValues[groupValue]?.toString() ?? '',
              onChanged: (newVal) => setState(() {
                stateValues[groupValue] = newVal;
              }),
            ),
            if (node['label'] != null) 
              Text(node['label']?.toString() ?? ''),
          ],
        );
        break;

      case 'image':
        core = ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: Image.network(
            node['url']?.toString() ?? 'https://via.placeholder.com/150',
            fit: _parseBoxFit(node['fit']),
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) => 
              Icon(Icons.broken_image, size: height ?? width ?? 100),
          ),
        );
        break;

      case 'button':
      case 'elevatedbutton':
        core = ElevatedButton(
          style: ElevatedButton.styleFrom(
  backgroundColor: _parseColor(node['backgroundColor']) ?? Theme.of(context).primaryColor,
  foregroundColor: _parseColor(node['color']) ?? Colors.white,
          textStyle: TextStyle(
            fontSize: (node['fontSize'] ?? 16).toDouble(),
            fontWeight: _parseFontWeight(node['weight']) ?? FontWeight.normal,
          ),
          padding: _parseEdgeInsets(node['padding']) ?? EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
          onPressed: () {
            print("Pressed: ${node['text']}, state: $stateValues");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pressed: ${node['text']?.toString() ?? node['label']?.toString()  ?? 'Button'}")),
            );
          },
          child: Text(node['text']?.toString() ?? node['label']?.toString() ?? 'Button',
            style: TextStyle(
              fontSize: (node['fontSize'] ?? 18).toDouble(),
              fontWeight: _parseFontWeight(node['weight']) ?? FontWeight.normal,
              color: _parseColor(node['color']) ?? Colors.white,
            ),
          ),
        );
        break;

      case 'icon':
        core = Icon(
          _parseIcon(node['icon']),
          size: (node['size'] ?? 24).toDouble(),
          color: _parseColor(node['color']),
        );
        break;

      case 'divider':
   core = Divider(
  height: height,
  thickness: (node['thickness'] ?? 1).toDouble(),
  color: _parseColor(node['color']),
  indent: (node['indent'] ?? 0).toDouble(),
  endIndent: (node['endIndent'] ?? 0).toDouble(),
);
        break;

      case 'spacer':
        core = Spacer(flex: (node['flex'] ?? 1) as int);
        break;

      case 'card':
        core = Card(
          color: bgColor,
          elevation: (node['elevation'] ?? 1).toDouble(),
          shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: borderRadius) : null,
          child: Padding(
            padding: _parseEdgeInsets(node['padding']) ?? EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children.map((child) => buildWidget(child)).toList(),
            ),
          ),
        );
        break;

      case 'container':
        core = Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius,
            border: node['border'] == true 
              ? Border.all(color: _parseColor(node['borderColor']) ?? Colors.black)
              : null,
          ),
          alignment: alignment,
     child: node.containsKey('child')
    ? buildWidget(node['child'])
    : (children.isNotEmpty
        ? (children.length == 1 
            ? buildWidget(children.first)
            : Column(children: children.map((child) => buildWidget(child)).toList()))
        : null),

        );
        break;

      case 'listview':
        core = ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: children.map((child) => buildWidget(child)).toList(),
        );
        break;

      case 'gridview':
        core = GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: (node['crossAxisCount'] ?? 2) as int,
          childAspectRatio: (node['childAspectRatio'] ?? 1).toDouble(),
          children: children.map((child) => buildWidget(child)).toList(),
        );
        break;

      case 'dropdownbutton':
        final dropdownKey = key ?? 'dropdown_${node['label']}';
   final items = (node['items'] as List).map<DropdownMenuItem<String>>((item) {
  if (item is String) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(item),
    );
  } else if (item is Map) {
    return DropdownMenuItem<String>(
      value: item['value']?.toString(),
      child: Text(item['label']?.toString() ?? item['value']?.toString() ?? ''),
    );
  } else {
    return DropdownMenuItem<String>(
      value: item.toString(),
      child: Text(item.toString()),
    );
  }
}).toList();

        
        core = DropdownButtonFormField<String>(
       value: stateValues[dropdownKey]?.toString() ?? (items.isNotEmpty ? items.first.value : null),

          decoration: InputDecoration(
            labelText: node['label']?.toString(),
            border: OutlineInputBorder(),
          ),
          items: items,
          onChanged: (newVal) => setState(() {
            stateValues[dropdownKey] = newVal;
          }),
        );
        break;

      default:
        core = SizedBox.shrink();
    }

    // Wrap with padding/margin if specified
    Widget result = core;
    if (padding != null || margin != null || bgColor != null || borderRadius != null) {
      result = Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
        ),
        child: result,
      );
    }

    // Apply width/height constraints if specified
    if (width != null || height != null) {
      result = SizedBox(
        width: width,
        height: height,
        child: result,
      );
    }

    // Apply alignment if specified
    if (alignment != null) {
      result = Align(
        alignment: alignment,
        child: result,
      );
    }

    return result;
  }

  IconData? _parseIcon(dynamic icon) {
    if (icon is String) {
      switch (icon.toLowerCase()) {
        case 'home': return Icons.home;
        case 'settings': return Icons.settings;
        case 'person': return Icons.person;
         case 'facebook': return Icons.facebook;
        case 'email': return Icons.email;
        case 'lock': return Icons.lock;
        case 'search': return Icons.search;
        case 'menu': return Icons.menu;
        case 'arrowback': return Icons.arrow_back;
        case 'add': return Icons.add;
        case 'delete': return Icons.delete;
        case 'star': return Icons.star;
        case 'favorite': return Icons.favorite;
        case 'camera': return Icons.camera_alt;
        case 'phone': return Icons.phone;
        case 'alarm': return Icons.alarm;
        case 'calendar': return Icons.calendar_today;
        case 'map': return Icons.map;
        case 'info': return Icons.info;
        case 'check': return Icons.check;
        case 'close': return Icons.close;
        default: return Icons.widgets;
      }
    }
    return Icons.widgets;
  }

  TextAlign? _parseTextAlign(String? align) {
    switch (align?.toLowerCase()) {
      case 'left': return TextAlign.left;
      case 'right': return TextAlign.right;
      case 'center': return TextAlign.center;
      case 'justify': return TextAlign.justify;
      case 'start': return TextAlign.start;
      case 'end': return TextAlign.end;
      default: return null;
    }
  }

  TextInputType? _parseKeyboardType(String? type) {
    switch (type?.toLowerCase()) {
      case 'text': return TextInputType.text;
      case 'number': return TextInputType.number;
      case 'phone': return TextInputType.phone;
      case 'email': return TextInputType.emailAddress;
      case 'url': return TextInputType.url;
      case 'multiline': return TextInputType.multiline;
      default: return null;
    }
  }

  BoxFit? _parseBoxFit(String? fit) {
    switch (fit?.toLowerCase()) {
      case 'fill': return BoxFit.fill;
      case 'contain': return BoxFit.contain;
      case 'cover': return BoxFit.cover;
      case 'fitwidth': return BoxFit.fitWidth;
      case 'fitheight': return BoxFit.fitHeight;
      case 'none': return BoxFit.none;
      case 'scaledown': return BoxFit.scaleDown;
      default: return null;
    }
  }
}