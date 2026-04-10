import 'package:flutter/material.dart';


class AppPallete {
  
 
  // --- Backgrounds ---
  static const Color background = Color(0xFF141820); // main scaffold bg
  static const Color surface    = Color(0xFF1C2230); // bottom sheets, drawers
  static const Color card       = Color(0xFF232C3E); // cards, list tiles
  static const Color elevated   = Color(0xFF2A3348); // modals, dialogs (slightly lifted)
 
  // --- Primary & Accent ---
  static const Color primary       = Color(0xFF5BA3C9); // dusty sky blue
  static const Color primaryLight  = Color(0xFF8FBFDA); // accent / highlights
  static const Color primaryDark   = Color(0xFF3A7FA8); // pressed / active state
  static const Color primarySplash = Color(0x195BA3C9); // ripple / splash
 
  // --- Text ---
  static const Color textPrimary   = Color(0xFFCBD8E8); // headings & body
  static const Color textSecondary = Color(0xFF647A91); // captions, subtitles
  static const Color textDisabled  = Color(0xFF3E5060); // disabled states
  static const Color textOnPrimary = Color(0xFF0A1520); // text on primary buttons
 
  // --- Semantic ---
  static const Color success = Color(0xFF6DBF9E); // soft teal green
  static const Color warning = Color(0xFFD4A847); // muted amber
  static const Color error   = Color(0xFFCC6B6B); // muted red (not harsh)
  static const Color info    = Color(0xFF5BA3C9); // same as primary
 
  // --- Surface tints (for tags, chips, badges) ---
  static const Color tagBackground = Color(0xFF102030); // tag/chip bg
  static const Color tagText       = Color(0xFF5BA3C9); // tag text
  static const Color successBg     = Color(0xFF0D2218); // success badge bg
  static const Color warningBg     = Color(0xFF251A05); // warning badge bg
  static const Color errorBg       = Color(0xFF2A1010); // error badge bg
 
  // --- Borders & Dividers ---
  static const Color divider      = Color(0xFF283444); // list dividers
  static const Color border       = Color(0xFF2E3D52); // input borders, outlines
  static const Color borderFocus  = Color(0xFF5BA3C9); // focused input border
 
  // --- Icon ---
  static const Color iconDefault  = Color(0xFF647A91);
  static const Color iconActive   = Color(0xFF5BA3C9);

  // --- Gradient 
  static const Color gradient1 = Color(0xFF6DCBB0);
  static const Color gradient2 =  Color(0xFF5BA3C9);
  static const Color gradient3 =  Color(0xFF3A7FA8);
  static const Color transparentColor =  Colors.transparent;
}