// Region Flags
const ERROR = 0;
const NULLREGION = 1;
const SIMPLEREGION = 2;
const COMPLEXREGION = 3;

// CombineRgn() Styles
const RGN_AND = 1;
const RGN_OR = 2;
const RGN_XOR = 3;
const RGN_DIFF = 4;
const RGN_COPY = 5;
const RGN_MIN = RGN_AND;
const RGN_MAX = RGN_COPY;

// PolyFill() Modes
const ALTERNATE = 1;
const WINDING = 2;
const POLYFILL_LAST = 2;

// Button Control Styles
const BS_PUSHBUTTON = 0x00000000;
const BS_DEFPUSHBUTTON = 0x00000001;
const BS_CHECKBOX = 0x00000002;
const BS_AUTOCHECKBOX = 0x00000003;
const BS_RADIOBUTTON = 0x00000004;
const BS_3STATE = 0x00000005;
const BS_AUTO3STATE = 0x00000006;
const BS_GROUPBOX = 0x00000007;
const BS_USERBUTTON = 0x00000008;
const BS_AUTORADIOBUTTON = 0x00000009;
const BS_PUSHBOX = 0x0000000A;
const BS_OWNERDRAW = 0x0000000B;
const BS_TYPEMASK = 0x0000000F;
const BS_LEFTTEXT = 0x00000020;
const BS_TEXT = 0x00000000;
const BS_ICON = 0x00000040;
const BS_BITMAP = 0x00000080;
const BS_LEFT = 0x00000100;
const BS_RIGHT = 0x00000200;
const BS_CENTER = 0x00000300;
const BS_TOP = 0x00000400;
const BS_BOTTOM = 0x00000800;
const BS_VCENTER = 0x00000C00;
const BS_PUSHLIKE = 0x00001000;
const BS_MULTILINE = 0x00002000;
const BS_NOTIFY = 0x00004000;
const BS_FLAT = 0x00008000;
const BS_RIGHTBUTTON = BS_LEFTTEXT;

// Window Messages
const WM_MDICREATE = 0x0220;
const WM_MDIDESTROY = 0x0221;
const WM_MDIACTIVATE = 0x0222;
const WM_MDIRESTORE = 0x0223;
const WM_MDINEXT = 0x0224;
const WM_MDIMAXIMIZE = 0x0225;
const WM_MDITILE = 0x0226;
const WM_MDICASCADE = 0x0227;
const WM_MDIICONARRANGE = 0x0228;
const WM_MDIGETACTIVE = 0x0229;
const WM_MDISETMENU = 0x0230;
const WM_ENTERSIZEMOVE = 0x0231;
const WM_EXITSIZEMOVE = 0x0232;
const WM_DROPFILES = 0x0233;
const WM_MDIREFRESHMENU = 0x0234;
const WM_IME_SETCONTEXT = 0x0281;
const WM_IME_NOTIFY = 0x0282;
const WM_IME_CONTROL = 0x0283;
const WM_IME_COMPOSITIONFULL = 0x0284;
const WM_IME_SELECT = 0x0285;
const WM_IME_CHAR = 0x0286;
const WM_IME_REQUEST = 0x0288;
const WM_IME_KEYDOWN = 0x0290;
const WM_IME_KEYUP = 0x0291;
const WM_MOUSEHOVER = 0x02A1;
const WM_MOUSELEAVE = 0x02A3;
const WM_NCMOUSEHOVER = 0x02A0;
const WM_NCMOUSELEAVE = 0x02A2;

// Extended Window Styles
const WS_EX_DLGMODALFRAME = 0x00000001;
const WS_EX_NOPARENTNOTIFY = 0x00000004;
const WS_EX_TOPMOST = 0x00000008;
const WS_EX_ACCEPTFILES = 0x00000010;
const WS_EX_TRANSPARENT = 0x00000020;
const WS_EX_MDICHILD = 0x00000040;
const WS_EX_TOOLWINDOW = 0x00000080;
const WS_EX_WINDOWEDGE = 0x00000100;
const WS_EX_CLIENTEDGE = 0x00000200;
const WS_EX_CONTEXTHELP = 0x00000400;
const WS_EX_RIGHT = 0x00001000;
const WS_EX_LEFT = 0x00000000;
const WS_EX_RTLREADING = 0x00002000;
const WS_EX_LTRREADING = 0x00000000;
const WS_EX_LEFTSCROLLBAR = 0x00004000;
const WS_EX_RIGHTSCROLLBAR = 0x00000000;
const WS_EX_CONTROLPARENT = 0x00010000;
const WS_EX_STATICEDGE = 0x00020000;
const WS_EX_APPWINDOW = 0x00040000;
const WS_EX_OVERLAPPEDWINDOW = (WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE);
const WS_EX_PALETTEWINDOW =
    (WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW | WS_EX_TOPMOST);
const WS_EX_LAYERED = 0x00080000;

// Binary raster ops
const R2_BLACK = 1; //  0
const R2_NOTMERGEPEN = 2; // DPon
const R2_MASKNOTPEN = 3; // DPna
const R2_NOTCOPYPEN = 4; // PN
const R2_MASKPENNOT = 5; // PDna
const R2_NOT = 6; // Dn
const R2_XORPEN = 7; // DPx
const R2_NOTMASKPEN = 8; // DPan
const R2_MASKPEN = 9; // DPa
const R2_NOTXORPEN = 10; // DPxn
const R2_NOP = 11; // D
const R2_MERGENOTPEN = 12; // DPno
const R2_COPYPEN = 13; // P
const R2_MERGEPENNOT = 14; // PDno
const R2_MERGEPEN = 15; // DPo
const R2_WHITE = 16; //  1
const R2_LAST = 16;

// Hatch Styles
const HS_HORIZONTAL = 0; // -----
const HS_VERTICAL = 1; // |||||
const HS_FDIAGONAL = 2; // \\\\\
const HS_BDIAGONAL = 3; // /////
const HS_CROSS = 4; // +++++
const HS_DIAGCROSS = 5; // xxxxx

// Pen Styles
const PS_SOLID = 0;
const PS_DASH = 1; // -------
const PS_DOT = 2; // .......
const PS_DASHDOT = 3; // _._._._
const PS_DASHDOTDOT = 4; // _.._.._
const PS_NULL = 5;
const PS_INSIDEFRAME = 6;
const PS_USERSTYLE = 7;
const PS_ALTERNATE = 8;
const PS_STYLE_MASK = 0x0000000F;
const PS_ENDCAP_ROUND = 0x00000000;
const PS_ENDCAP_SQUARE = 0x00000100;
const PS_ENDCAP_FLAT = 0x00000200;
const PS_ENDCAP_MASK = 0x00000F00;
const PS_JOIN_ROUND = 0x00000000;
const PS_JOIN_BEVEL = 0x00001000;
const PS_JOIN_MITER = 0x00002000;
const PS_JOIN_MASK = 0x0000F000;
const PS_COSMETIC = 0x00000000;
const PS_GEOMETRIC = 0x00010000;
const PS_TYPE_MASK = 0x000F0000;
const AD_COUNTERCLOCKWISE = 1;
const AD_CLOCKWISE = 2;

// Device Parameters for GetDeviceCaps()
const DRIVERVERSION = 0; // Device driver version
const TECHNOLOGY = 2; // Device classification
const HORZSIZE = 4; // Horizontal size in millimeters
const VERTSIZE = 6; // Vertical size in millimeters
const HORZRES = 8; // Horizontal width in pixels
const VERTRES = 10; // Vertical height in pixels
const BITSPIXEL = 12; // Number of bits per pixel
const PLANES = 14; // Number of planes
const NUMBRUSHES = 16; // Number of brushes the device has
const NUMPENS = 18; // Number of pens the device has
const NUMMARKERS = 20; // Number of markers the device has
const NUMFONTS = 22; // Number of fonts the device has
const NUMCOLORS = 24; // Number of colors the device supports
const PDEVICESIZE = 26; // Size required for device descriptor
const CURVECAPS = 28; // Curve capabilities
const LINECAPS = 30; // Line capabilities
const POLYGONALCAPS = 32; // Polygonal capabilities
const TEXTCAPS = 34; // Text capabilities
const CLIPCAPS = 36; // Clipping capabilities
const RASTERCAPS = 38; // Bitblt capabilities
const ASPECTX = 40; // Length of the X leg
const ASPECTY = 42; // Length of the Y leg
const ASPECTXY = 44; // Length of the hypotenuse
const LOGPIXELSX = 88; // Logical pixels/inch in X
const LOGPIXELSY = 90; // Logical pixels/inch in Y
const SIZEPALETTE = 104; // Number of entries in physical palette
const NUMRESERVED = 106; // Number of reserved entries in palette
const COLORRES = 108; // Actual color resolution
