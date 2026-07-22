import 'package:flutter/material.dart';

/// All colors used across the general ledger app.
/// Never hardcode a Color(0x...) directly in a widget — always reference
/// a constant from here. This is what makes dark mode a one-file change
/// instead of a find-and-replace across every screen.
class GColors {
  GColors._();

  // ============================================================
  // BRAND
  // ============================================================
  static const Color primary = Color(0xFF534AB7); // purple — hero balance card, active tab
  static const Color primaryLight = Color(0xFFEEEDFE); // purple tint — balance card background
  static const Color secondary = Color(0xFF185FA5); // blue — used for profit + informational accents

  // ============================================================
  // NEUTRALS — light mode
  // ============================================================
  static const Color white = Color(0xFFFFFFFF);
  static const Color light = Color(0xFFF5F6FA); // scaffold background, light mode
  static const Color dark = Color(0xFF1A1A1A); // primary text, light mode
  static const Color grey = Color(0xFF888780); // secondary/muted text, light mode
  static const Color lightGrey = Color(0xFFE3E2DC); // borders, dividers, light mode
  static const Color cardLight = Color(0xFFFFFFFF); // card surface, light mode

  // ============================================================
  // NEUTRALS — dark mode
  // ============================================================
  static const Color scaffoldDark = Color(0xFF141414); // scaffold background, dark mode
  static const Color cardDark = Color(0xFF1F1F1F); // card surface, dark mode
  static const Color textPrimaryDark = Color(0xFFF1EFE8); // primary text, dark mode
  static const Color textSecondaryDark = Color(0xFFB4B2A9); // secondary/muted text, dark mode
  static const Color borderDark = Color(0xFF3A3A38); // borders, dividers, dark mode

  // ============================================================
  // SEMANTIC — financial meaning (same in light + dark; adjust
  // opacity/background per mode, not the base hue, so income is
  // always "the same green" everywhere in the app)
  // ============================================================

  // Income / money in / posted / balanced — green family
  static const Color income = Color(0xFF3B6D11);
  static const Color incomeBg = Color(0xFFEAF3DE); // light-mode chip/card background
  static const Color incomeBgDark = Color(0xFF1B2A0E); // dark-mode chip/card background

  // Expense / money out — red family
  static const Color expense = Color(0xFFA32D2D);
  static const Color expenseBg = Color(0xFFFCEBEB);
  static const Color expenseBgDark = Color(0xFF2E1414);

  // Profit / derived value — blue family
  static const Color profit = Color(0xFF185FA5);
  static const Color profitBg = Color(0xFFE6F1FB);
  static const Color profitBgDark = Color(0xFF10202E);

  // Status: posted (locked, reliable) — reuses income green
  static const Color posted = income;
  static const Color postedBg = incomeBg;
  static const Color postedBgDark = incomeBgDark;

  // Status: draft (editable, incomplete) — neutral gray
  static const Color draft = Color(0xFF5F5E5A);
  static const Color draftBg = Color(0xFFF1EFE8);
  static const Color draftBgDark = Color(0xFF2C2C2A);

  // Balance check on journal entry form
  static const Color balanced = income;
  static const Color balancedBg = incomeBg;
  static const Color unbalanced = expense;
  static const Color unbalancedBg = expenseBg;

  // Account type colors (Chart of Accounts) — each type keeps one
  // consistent color everywhere it appears (list, forms, reports)
  static const Color assetColor = Color(0xFF185FA5); // blue
  static const Color assetBg = Color(0xFFE6F1FB);
  static const Color liabilityColor = Color(0xFF993C1D); // coral/orange
  static const Color liabilityBg = Color(0xFFFAECE7);
  static const Color equityColor = Color(0xFF27500A); // green
  static const Color equityBg = Color(0xFFEAF3DE);
  static const Color incomeAccountColor = income;
  static const Color incomeAccountBg = incomeBg;
  static const Color expenseAccountColor = expense;
  static const Color expenseAccountBg = expenseBg;

    // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkGrey = Color(0xFF939393);

}
