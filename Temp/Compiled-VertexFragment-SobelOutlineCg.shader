// Compiled shader for PC, Mac & Linux Standalone

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "VertexFragment/SobelOutlineCg" {
SubShader { 
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionDepthMap" to slot 1
Set 2D Texture "_CameraDepthTexture" to slot 2
Set 2D Texture "_CameraGBufferTexture2" to slot 3

Constant Buffer "$Globals" (80 bytes) {
  Vector4 _ScreenParams at 0
  Vector4 _ZBufferParams at 16
  Float _OutlineThickness at 32
  Float _OutlineDepthMultiplier at 36
  Float _OutlineDepthBias at 40
  Float _OutlineNormalMultiplier at 44
  Float _OutlineNormalBias at 48
  Float _OutlineDensity at 52
  Vector4 _OutlineColor at 64
}

Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  vec4 in_POSITION0;
out vec2 vs_TEXCOORD0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, -0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 _ZBufferParams;
uniform 	float _OutlineThickness;
uniform 	float _OutlineDepthMultiplier;
uniform 	float _OutlineDepthBias;
uniform 	float _OutlineNormalMultiplier;
uniform 	float _OutlineNormalBias;
uniform 	float _OutlineDensity;
uniform 	vec4 _OutlineColor;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _OcclusionDepthMap;
UNITY_LOCATION(2) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform  sampler2D _CameraGBufferTexture2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat18;
float u_xlat24;
bool u_xlatb24;
float u_xlat26;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xy = vec2(1.0, 1.0) / _ScreenParams.xy;
    u_xlat1.xw = u_xlat1.xy * vec2(_OutlineThickness);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat2 = texture(_OcclusionDepthMap, vs_TEXCOORD0.xy);
    u_xlat3 = (-u_xlat1.xzzw) + vs_TEXCOORD0.xyxy;
    u_xlat4 = texture(_OcclusionDepthMap, u_xlat3.xy);
    u_xlat1 = u_xlat1 + vs_TEXCOORD0.xyxy;
    u_xlat5 = texture(_OcclusionDepthMap, u_xlat1.xy);
    u_xlat6 = texture(_OcclusionDepthMap, u_xlat1.zw);
    u_xlat7 = texture(_OcclusionDepthMap, u_xlat3.zw);
    u_xlat24 = (-u_xlat2.x) + u_xlat4.x;
    u_xlat10.x = (-u_xlat2.x) + u_xlat5.x;
    u_xlat24 = abs(u_xlat24) + abs(u_xlat10.x);
    u_xlat10.x = (-u_xlat2.x) + u_xlat6.x;
    u_xlat24 = u_xlat24 + abs(u_xlat10.x);
    u_xlat2.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat24 = u_xlat24 + abs(u_xlat2.x);
    u_xlatb24 = 0.0<u_xlat24;
    if(u_xlatb24){
        SV_Target0.xyz = u_xlat0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat2 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat24 = _ZBufferParams.x * u_xlat2.x + _ZBufferParams.y;
    u_xlat24 = float(1.0) / u_xlat24;
    u_xlat24 = max(u_xlat24, 0.200000003);
    u_xlat24 = min(u_xlat24, 0.400000006);
    u_xlat24 = u_xlat24 + -0.200000003;
    u_xlat24 = u_xlat24 * -5.0 + 1.0;
    u_xlatb10 = 0.0>=u_xlat24;
    if(u_xlatb10){
        SV_Target0.xyz = u_xlat0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat4 = texture(_CameraDepthTexture, u_xlat3.xy);
    u_xlat10.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat4 = texture(_CameraDepthTexture, u_xlat1.xy);
    u_xlat18 = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat10.y = float(1.0) / u_xlat18;
    u_xlat4 = texture(_CameraDepthTexture, u_xlat1.zw);
    u_xlat26 = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat4 = texture(_CameraDepthTexture, u_xlat3.zw);
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat10.xy = (-u_xlat2.xx) + u_xlat10.xy;
    u_xlat10.x = abs(u_xlat10.y) + abs(u_xlat10.x);
    u_xlat18 = (-u_xlat2.x) + u_xlat26;
    u_xlat10.x = abs(u_xlat18) + u_xlat10.x;
    u_xlat2.x = (-u_xlat2.x) + u_xlat4.x;
    u_xlat2.x = abs(u_xlat2.x) + u_xlat10.x;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat2.x = u_xlat2.x * _OutlineDepthMultiplier;
    u_xlat2.x = log2(abs(u_xlat2.x));
    u_xlat2.x = u_xlat2.x * _OutlineDepthBias;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4 = texture(_CameraGBufferTexture2, vs_TEXCOORD0.xy);
    u_xlat5 = texture(_CameraGBufferTexture2, u_xlat3.xy);
    u_xlat6 = texture(_CameraGBufferTexture2, u_xlat1.xy);
    u_xlat1 = texture(_CameraGBufferTexture2, u_xlat1.zw);
    u_xlat3 = texture(_CameraGBufferTexture2, u_xlat3.zw);
    u_xlat10.xyz = (-u_xlat4.xyz) + u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + u_xlat6.xyz;
    u_xlat10.xyz = abs(u_xlat10.xyz) + abs(u_xlat5.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = abs(u_xlat1.xyz) + u_xlat10.xyz;
    u_xlat10.xyz = (-u_xlat4.xyz) + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + abs(u_xlat10.xyz);
    u_xlat1.x = u_xlat1.y + u_xlat1.x;
    u_xlat1.x = u_xlat1.z + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _OutlineNormalMultiplier;
    u_xlat1.x = log2(abs(u_xlat1.x));
    u_xlat1.x = u_xlat1.x * _OutlineNormalBias;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = max(u_xlat1.x, u_xlat2.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat9.x = (-_OutlineDensity) + 1.0;
    u_xlat1.x = u_xlat1.x + (-_OutlineDensity);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat1.x = u_xlat9.x * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat1.x = _OutlineColor.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.xyz = (-u_xlat0.xyz) + _OutlineColor.xyz;
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    SV_Target0.xyz = vec3(u_xlat24) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


//////////////////////////////////////////////////////
Global Keywords: <none>
Local Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "vulkan":
Uses vertex data channel "Vertex"

Set 2D Texture "_CameraDepthTexture" to set: 0, binding: 6, used in: Fragment  using sampler in set: 0, binding: 1, used in: Fragment 
Set 2D Texture "_CameraGBufferTexture2" to set: 0, binding: 7, used in: Fragment  using sampler in set: 0, binding: 2, used in: Fragment 
Set 2D Texture "_MainTex" to set: 0, binding: 4, used in: Fragment  using sampler in set: 0, binding: 0, used in: Fragment 
Set 2D Texture "_OcclusionDepthMap" to set: 0, binding: 5, used in: Fragment  using sampler in set: 0, binding: 3, used in: Fragment 

Constant Buffer "PGlobals3915847148" (80 bytes) on set: 1, binding: 0, used in: Fragment  {
  Vector4 _OutlineColor at 64
  Float _OutlineDensity at 52
  Float _OutlineDepthBias at 40
  Float _OutlineDepthMultiplier at 36
  Float _OutlineNormalBias at 48
  Float _OutlineNormalMultiplier at 44
  Float _OutlineThickness at 32
  Vector4 _ScreenParams at 0
  Vector4 _ZBufferParams at 16
}

Shader Disassembly:
Disassembly for Vertex:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 59

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Vertex 4  "main" 13 17 32
                              Name 32  "vs_TEXCOORD0"
                              MemberDecorate 11 0 BuiltIn Position
                              MemberDecorate 11 1 BuiltIn PointSize
                              MemberDecorate 11 2 BuiltIn ClipDistance
                              Decorate 11 Block
                              Decorate 17 Location 0
                              Decorate 32(vs_TEXCOORD0) Location 0
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 4
               8:             TypeInt 32 0
               9:      8(int) Constant 1
              10:             TypeArray 6(float) 9
              11:             TypeStruct 7(fvec4) 6(float) 10
              12:             TypePointer Output 11(struct)
              13:     12(ptr) Variable Output
              14:             TypeInt 32 1
              15:     14(int) Constant 0
              16:             TypePointer Input 7(fvec4)
              17:     16(ptr) Variable Input
              18:             TypeVector 6(float) 2
              21:             TypePointer Output 7(fvec4)
              25:    6(float) Constant 0
              26:    6(float) Constant 1065353216
              27:   18(fvec2) ConstantComposite 25 26
              31:             TypePointer Output 18(fvec2)
32(vs_TEXCOORD0):     31(ptr) Variable Output
              35:    6(float) Constant 1056964608
              36:    6(float) Constant 3204448256
              37:   18(fvec2) ConstantComposite 35 36
              39:   18(fvec2) ConstantComposite 35 35
              41:             TypePointer Output 6(float)
              47:             TypePointer Function 7(fvec4)
              49:             TypeVector 14(int) 4
              50:             TypePointer Function 49(ivec4)
              52:             TypeBool
              53:             TypeVector 52(bool) 4
              54:             TypePointer Function 53(bvec4)
              56:             TypeVector 8(int) 4
              57:             TypePointer Function 56(ivec4)
               4:           2 Function None 3
               5:             Label
              48:     47(ptr) Variable Function
              51:     50(ptr) Variable Function
              55:     54(ptr) Variable Function
              58:     57(ptr) Variable Function
              19:    7(fvec4) Load 17
              20:   18(fvec2) VectorShuffle 19 19 0 1
              22:     21(ptr) AccessChain 13 15
              23:    7(fvec4) Load 22
              24:    7(fvec4) VectorShuffle 23 20 4 5 2 3
                              Store 22 24
              28:     21(ptr) AccessChain 13 15
              29:    7(fvec4) Load 28
              30:    7(fvec4) VectorShuffle 29 27 0 1 4 5
                              Store 28 30
              33:    7(fvec4) Load 17
              34:   18(fvec2) VectorShuffle 33 33 0 1
              38:   18(fvec2) FMul 34 37
              40:   18(fvec2) FAdd 38 39
                              Store 32(vs_TEXCOORD0) 40
              42:     41(ptr) AccessChain 13 15 9
              43:    6(float) Load 42
              44:    6(float) FNegate 43
              45:     41(ptr) AccessChain 13 15 9
                              Store 45 44
                              Return
                              FunctionEnd

Disassembly for Fragment:
// Module Version 10000
// Generated by (magic number): 80006
// Id's are bound by 564

                              Capability Shader
               1:             ExtInstImport  "GLSL.std.450"
                              MemoryModel Logical GLSL450
                              EntryPoint Fragment 4  "main" 22 159
                              ExecutionMode 4 OriginUpperLeft
                              Name 22  "vs_TEXCOORD0"
                              Decorate 12 DescriptorSet 0
                              Decorate 12 Binding 4
                              Decorate 16 DescriptorSet 0
                              Decorate 16 Binding 0
                              Decorate 22(vs_TEXCOORD0) Location 0
                              MemberDecorate 31 0 Offset 0
                              MemberDecorate 31 1 Offset 16
                              MemberDecorate 31 2 Offset 32
                              MemberDecorate 31 3 Offset 36
                              MemberDecorate 31 4 Offset 40
                              MemberDecorate 31 5 Offset 44
                              MemberDecorate 31 6 Offset 48
                              MemberDecorate 31 7 Offset 52
                              MemberDecorate 31 8 Offset 64
                              Decorate 31 Block
                              Decorate 33 DescriptorSet 1
                              Decorate 33 Binding 0
                              Decorate 61 DescriptorSet 0
                              Decorate 61 Binding 5
                              Decorate 63 DescriptorSet 0
                              Decorate 63 Binding 3
                              Decorate 159 Location 0
                              Decorate 167 DescriptorSet 0
                              Decorate 167 Binding 6
                              Decorate 169 DescriptorSet 0
                              Decorate 169 Binding 1
                              Decorate 359 DescriptorSet 0
                              Decorate 359 Binding 7
                              Decorate 361 DescriptorSet 0
                              Decorate 361 Binding 2
               2:             TypeVoid
               3:             TypeFunction 2
               6:             TypeFloat 32
               7:             TypeVector 6(float) 3
               8:             TypePointer Private 7(fvec3)
               9:      8(ptr) Variable Private
              10:             TypeImage 6(float) 2D sampled format:Unknown
              11:             TypePointer UniformConstant 10
              12:     11(ptr) Variable UniformConstant
              14:             TypeSampler
              15:             TypePointer UniformConstant 14
              16:     15(ptr) Variable UniformConstant
              18:             TypeSampledImage 10
              20:             TypeVector 6(float) 2
              21:             TypePointer Input 20(fvec2)
22(vs_TEXCOORD0):     21(ptr) Variable Input
              24:             TypeVector 6(float) 4
              27:             TypePointer Private 24(fvec4)
              28:     27(ptr) Variable Private
              29:    6(float) Constant 1065353216
              30:   20(fvec2) ConstantComposite 29 29
              31:             TypeStruct 24(fvec4) 24(fvec4) 6(float) 6(float) 6(float) 6(float) 6(float) 6(float) 24(fvec4)
              32:             TypePointer Uniform 31(struct)
              33:     32(ptr) Variable Uniform
              34:             TypeInt 32 1
              35:     34(int) Constant 0
              36:             TypePointer Uniform 24(fvec4)
              45:     34(int) Constant 2
              46:             TypePointer Uniform 6(float)
              53:    6(float) Constant 0
              54:             TypeInt 32 0
              55:     54(int) Constant 1
              56:             TypePointer Private 6(float)
              58:     54(int) Constant 2
              60:     56(ptr) Variable Private
              61:     11(ptr) Variable UniformConstant
              63:     15(ptr) Variable UniformConstant
              68:     54(int) Constant 0
              70:     27(ptr) Variable Private
              77:             TypePointer Private 20(fvec2)
              78:     77(ptr) Variable Private
              99:     56(ptr) Variable Private
             107:     56(ptr) Variable Private
             128:      8(ptr) Variable Private
             150:             TypeBool
             151:             TypePointer Private 150(bool)
             152:    151(ptr) Variable Private
             158:             TypePointer Output 24(fvec4)
             159:    158(ptr) Variable Output
             163:     54(int) Constant 3
             164:             TypePointer Output 6(float)
             167:     11(ptr) Variable UniformConstant
             169:     15(ptr) Variable UniformConstant
             175:     34(int) Constant 1
             190:    6(float) Constant 1045220557
             195:    6(float) Constant 1053609165
             200:    6(float) Constant 3192704205
             205:    6(float) Constant 3231711232
             209:    151(ptr) Variable Private
             284:      8(ptr) Variable Private
             345:     34(int) Constant 3
             353:     34(int) Constant 4
             359:     11(ptr) Variable UniformConstant
             361:     15(ptr) Variable UniformConstant
             374:      8(ptr) Variable Private
             456:     34(int) Constant 5
             468:     34(int) Constant 6
             483:     34(int) Constant 7
             505:    6(float) Constant 3221225472
             507:    6(float) Constant 1077936128
             521:     34(int) Constant 8
             529:      8(ptr) Variable Private
             553:             TypePointer Function 24(fvec4)
             555:             TypeVector 34(int) 4
             556:             TypePointer Function 555(ivec4)
             558:             TypeVector 150(bool) 4
             559:             TypePointer Function 558(bvec4)
             561:             TypeVector 54(int) 4
             562:             TypePointer Function 561(ivec4)
               4:           2 Function None 3
               5:             Label
             554:    553(ptr) Variable Function
             557:    556(ptr) Variable Function
             560:    559(ptr) Variable Function
             563:    562(ptr) Variable Function
              13:          10 Load 12
              17:          14 Load 16
              19:          18 SampledImage 13 17
              23:   20(fvec2) Load 22(vs_TEXCOORD0)
              25:   24(fvec4) ImageSampleImplicitLod 19 23
              26:    7(fvec3) VectorShuffle 25 25 0 1 2
                              Store 9 26
              37:     36(ptr) AccessChain 33 35
              38:   24(fvec4) Load 37
              39:   20(fvec2) VectorShuffle 38 38 0 1
              40:   20(fvec2) FDiv 30 39
              41:   24(fvec4) Load 28
              42:   24(fvec4) VectorShuffle 41 40 4 5 2 3
                              Store 28 42
              43:   24(fvec4) Load 28
              44:   20(fvec2) VectorShuffle 43 43 0 1
              47:     46(ptr) AccessChain 33 45
              48:    6(float) Load 47
              49:   20(fvec2) CompositeConstruct 48 48
              50:   20(fvec2) FMul 44 49
              51:   24(fvec4) Load 28
              52:   24(fvec4) VectorShuffle 51 50 4 1 2 5
                              Store 28 52
              57:     56(ptr) AccessChain 28 55
                              Store 57 53
              59:     56(ptr) AccessChain 28 58
                              Store 59 53
              62:          10 Load 61
              64:          14 Load 63
              65:          18 SampledImage 62 64
              66:   20(fvec2) Load 22(vs_TEXCOORD0)
              67:   24(fvec4) ImageSampleImplicitLod 65 66
              69:    6(float) CompositeExtract 67 0
                              Store 60 69
              71:   24(fvec4) Load 28
              72:   24(fvec4) VectorShuffle 71 71 0 2 2 3
              73:   24(fvec4) FNegate 72
              74:   20(fvec2) Load 22(vs_TEXCOORD0)
              75:   24(fvec4) VectorShuffle 74 74 0 1 0 1
              76:   24(fvec4) FAdd 73 75
                              Store 70 76
              79:          10 Load 61
              80:          14 Load 63
              81:          18 SampledImage 79 80
              82:   24(fvec4) Load 70
              83:   20(fvec2) VectorShuffle 82 82 0 1
              84:   24(fvec4) ImageSampleImplicitLod 81 83
              85:    6(float) CompositeExtract 84 0
              86:     56(ptr) AccessChain 78 68
                              Store 86 85
              87:   24(fvec4) Load 28
              88:   20(fvec2) Load 22(vs_TEXCOORD0)
              89:   24(fvec4) VectorShuffle 88 88 0 1 0 1
              90:   24(fvec4) FAdd 87 89
                              Store 28 90
              91:          10 Load 61
              92:          14 Load 63
              93:          18 SampledImage 91 92
              94:   24(fvec4) Load 28
              95:   20(fvec2) VectorShuffle 94 94 0 1
              96:   24(fvec4) ImageSampleImplicitLod 93 95
              97:    6(float) CompositeExtract 96 0
              98:     56(ptr) AccessChain 78 55
                              Store 98 97
             100:          10 Load 61
             101:          14 Load 63
             102:          18 SampledImage 100 101
             103:   24(fvec4) Load 28
             104:   20(fvec2) VectorShuffle 103 103 2 3
             105:   24(fvec4) ImageSampleImplicitLod 102 104
             106:    6(float) CompositeExtract 105 0
                              Store 99 106
             108:          10 Load 61
             109:          14 Load 63
             110:          18 SampledImage 108 109
             111:   24(fvec4) Load 70
             112:   20(fvec2) VectorShuffle 111 111 2 3
             113:   24(fvec4) ImageSampleImplicitLod 110 112
             114:    6(float) CompositeExtract 113 0
                              Store 107 114
             115:    6(float) Load 60
             116:   20(fvec2) CompositeConstruct 115 115
             117:   20(fvec2) FNegate 116
             118:   20(fvec2) Load 78
             119:   20(fvec2) FAdd 117 118
                              Store 78 119
             120:     56(ptr) AccessChain 78 55
             121:    6(float) Load 120
             122:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 121
             123:     56(ptr) AccessChain 78 68
             124:    6(float) Load 123
             125:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 124
             126:    6(float) FAdd 122 125
             127:     56(ptr) AccessChain 78 68
                              Store 127 126
             129:    6(float) Load 60
             130:    6(float) FNegate 129
             131:    6(float) Load 99
             132:    6(float) FAdd 130 131
             133:     56(ptr) AccessChain 128 68
                              Store 133 132
             134:     56(ptr) AccessChain 128 68
             135:    6(float) Load 134
             136:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 135
             137:     56(ptr) AccessChain 78 68
             138:    6(float) Load 137
             139:    6(float) FAdd 136 138
             140:     56(ptr) AccessChain 78 68
                              Store 140 139
             141:    6(float) Load 60
             142:    6(float) FNegate 141
             143:    6(float) Load 107
             144:    6(float) FAdd 142 143
                              Store 60 144
             145:    6(float) Load 60
             146:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 145
             147:     56(ptr) AccessChain 78 68
             148:    6(float) Load 147
             149:    6(float) FAdd 146 148
                              Store 60 149
             153:    6(float) Load 60
             154:   150(bool) FOrdLessThan 53 153
                              Store 152 154
             155:   150(bool) Load 152
                              SelectionMerge 157 None
                              BranchConditional 155 156 157
             156:               Label
             160:    7(fvec3)   Load 9
             161:   24(fvec4)   Load 159
             162:   24(fvec4)   VectorShuffle 161 160 4 5 6 3
                                Store 159 162
             165:    164(ptr)   AccessChain 159 163
                                Store 165 29
                                Return
             157:             Label
             168:          10 Load 167
             170:          14 Load 169
             171:          18 SampledImage 168 170
             172:   20(fvec2) Load 22(vs_TEXCOORD0)
             173:   24(fvec4) ImageSampleImplicitLod 171 172
             174:    6(float) CompositeExtract 173 0
                              Store 60 174
             176:     46(ptr) AccessChain 33 175 68
             177:    6(float) Load 176
             178:    6(float) Load 60
             179:    6(float) FMul 177 178
             180:     46(ptr) AccessChain 33 175 55
             181:    6(float) Load 180
             182:    6(float) FAdd 179 181
             183:     56(ptr) AccessChain 78 68
                              Store 183 182
             184:     56(ptr) AccessChain 78 68
             185:    6(float) Load 184
             186:    6(float) FDiv 29 185
             187:     56(ptr) AccessChain 78 68
                              Store 187 186
             188:     56(ptr) AccessChain 78 68
             189:    6(float) Load 188
             191:    6(float) ExtInst 1(GLSL.std.450) 40(FMax) 189 190
             192:     56(ptr) AccessChain 78 68
                              Store 192 191
             193:     56(ptr) AccessChain 78 68
             194:    6(float) Load 193
             196:    6(float) ExtInst 1(GLSL.std.450) 37(FMin) 194 195
             197:     56(ptr) AccessChain 78 68
                              Store 197 196
             198:     56(ptr) AccessChain 78 68
             199:    6(float) Load 198
             201:    6(float) FAdd 199 200
             202:     56(ptr) AccessChain 78 68
                              Store 202 201
             203:     56(ptr) AccessChain 78 68
             204:    6(float) Load 203
             206:    6(float) FMul 204 205
             207:    6(float) FAdd 206 29
             208:     56(ptr) AccessChain 78 68
                              Store 208 207
             210:     56(ptr) AccessChain 78 68
             211:    6(float) Load 210
             212:   150(bool) FOrdGreaterThanEqual 53 211
                              Store 209 212
             213:   150(bool) Load 209
                              SelectionMerge 215 None
                              BranchConditional 213 214 215
             214:               Label
             216:    7(fvec3)   Load 9
             217:   24(fvec4)   Load 159
             218:   24(fvec4)   VectorShuffle 217 216 4 5 6 3
                                Store 159 218
             219:    164(ptr)   AccessChain 159 163
                                Store 219 29
                                Return
             215:             Label
             221:     46(ptr) AccessChain 33 175 58
             222:    6(float) Load 221
             223:    6(float) Load 60
             224:    6(float) FMul 222 223
             225:     46(ptr) AccessChain 33 175 163
             226:    6(float) Load 225
             227:    6(float) FAdd 224 226
                              Store 60 227
             228:    6(float) Load 60
             229:    6(float) FDiv 29 228
                              Store 60 229
             230:          10 Load 167
             231:          14 Load 169
             232:          18 SampledImage 230 231
             233:   24(fvec4) Load 70
             234:   20(fvec2) VectorShuffle 233 233 0 1
             235:   24(fvec4) ImageSampleImplicitLod 232 234
             236:    6(float) CompositeExtract 235 0
             237:     56(ptr) AccessChain 128 68
                              Store 237 236
             238:     46(ptr) AccessChain 33 175 58
             239:    6(float) Load 238
             240:     56(ptr) AccessChain 128 68
             241:    6(float) Load 240
             242:    6(float) FMul 239 241
             243:     46(ptr) AccessChain 33 175 163
             244:    6(float) Load 243
             245:    6(float) FAdd 242 244
             246:     56(ptr) AccessChain 128 68
                              Store 246 245
             247:     56(ptr) AccessChain 128 68
             248:    6(float) Load 247
             249:    6(float) FDiv 29 248
             250:     56(ptr) AccessChain 128 68
                              Store 250 249
             251:          10 Load 167
             252:          14 Load 169
             253:          18 SampledImage 251 252
             254:   24(fvec4) Load 28
             255:   20(fvec2) VectorShuffle 254 254 0 1
             256:   24(fvec4) ImageSampleImplicitLod 253 255
             257:    6(float) CompositeExtract 256 0
                              Store 99 257
             258:     46(ptr) AccessChain 33 175 58
             259:    6(float) Load 258
             260:    6(float) Load 99
             261:    6(float) FMul 259 260
             262:     46(ptr) AccessChain 33 175 163
             263:    6(float) Load 262
             264:    6(float) FAdd 261 263
                              Store 99 264
             265:    6(float) Load 99
             266:    6(float) FDiv 29 265
             267:     56(ptr) AccessChain 128 55
                              Store 267 266
             268:          10 Load 167
             269:          14 Load 169
             270:          18 SampledImage 268 269
             271:   24(fvec4) Load 28
             272:   20(fvec2) VectorShuffle 271 271 2 3
             273:   24(fvec4) ImageSampleImplicitLod 270 272
             274:    6(float) CompositeExtract 273 0
                              Store 107 274
             275:     46(ptr) AccessChain 33 175 58
             276:    6(float) Load 275
             277:    6(float) Load 107
             278:    6(float) FMul 276 277
             279:     46(ptr) AccessChain 33 175 163
             280:    6(float) Load 279
             281:    6(float) FAdd 278 280
                              Store 107 281
             282:    6(float) Load 107
             283:    6(float) FDiv 29 282
                              Store 107 283
             285:          10 Load 167
             286:          14 Load 169
             287:          18 SampledImage 285 286
             288:   24(fvec4) Load 70
             289:   20(fvec2) VectorShuffle 288 288 2 3
             290:   24(fvec4) ImageSampleImplicitLod 287 289
             291:    6(float) CompositeExtract 290 0
             292:     56(ptr) AccessChain 284 68
                              Store 292 291
             293:     46(ptr) AccessChain 33 175 58
             294:    6(float) Load 293
             295:     56(ptr) AccessChain 284 68
             296:    6(float) Load 295
             297:    6(float) FMul 294 296
             298:     46(ptr) AccessChain 33 175 163
             299:    6(float) Load 298
             300:    6(float) FAdd 297 299
             301:     56(ptr) AccessChain 284 68
                              Store 301 300
             302:     56(ptr) AccessChain 284 68
             303:    6(float) Load 302
             304:    6(float) FDiv 29 303
             305:     56(ptr) AccessChain 284 68
                              Store 305 304
             306:    6(float) Load 60
             307:   20(fvec2) CompositeConstruct 306 306
             308:   20(fvec2) FNegate 307
             309:    7(fvec3) Load 128
             310:   20(fvec2) VectorShuffle 309 309 0 1
             311:   20(fvec2) FAdd 308 310
             312:    7(fvec3) Load 128
             313:    7(fvec3) VectorShuffle 312 311 3 4 2
                              Store 128 313
             314:     56(ptr) AccessChain 128 55
             315:    6(float) Load 314
             316:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 315
             317:     56(ptr) AccessChain 128 68
             318:    6(float) Load 317
             319:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 318
             320:    6(float) FAdd 316 319
             321:     56(ptr) AccessChain 128 68
                              Store 321 320
             322:    6(float) Load 60
             323:    6(float) FNegate 322
             324:    6(float) Load 107
             325:    6(float) FAdd 323 324
                              Store 99 325
             326:    6(float) Load 99
             327:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 326
             328:     56(ptr) AccessChain 128 68
             329:    6(float) Load 328
             330:    6(float) FAdd 327 329
             331:     56(ptr) AccessChain 128 68
                              Store 331 330
             332:    6(float) Load 60
             333:    6(float) FNegate 332
             334:     56(ptr) AccessChain 284 68
             335:    6(float) Load 334
             336:    6(float) FAdd 333 335
                              Store 60 336
             337:    6(float) Load 60
             338:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 337
             339:     56(ptr) AccessChain 128 68
             340:    6(float) Load 339
             341:    6(float) FAdd 338 340
                              Store 60 341
             342:    6(float) Load 60
             343:    6(float) ExtInst 1(GLSL.std.450) 37(FMin) 342 29
                              Store 60 343
             344:    6(float) Load 60
             346:     46(ptr) AccessChain 33 345
             347:    6(float) Load 346
             348:    6(float) FMul 344 347
                              Store 60 348
             349:    6(float) Load 60
             350:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 349
             351:    6(float) ExtInst 1(GLSL.std.450) 30(Log2) 350
                              Store 60 351
             352:    6(float) Load 60
             354:     46(ptr) AccessChain 33 353
             355:    6(float) Load 354
             356:    6(float) FMul 352 355
                              Store 60 356
             357:    6(float) Load 60
             358:    6(float) ExtInst 1(GLSL.std.450) 29(Exp2) 357
                              Store 60 358
             360:          10 Load 359
             362:          14 Load 361
             363:          18 SampledImage 360 362
             364:   20(fvec2) Load 22(vs_TEXCOORD0)
             365:   24(fvec4) ImageSampleImplicitLod 363 364
             366:    7(fvec3) VectorShuffle 365 365 0 1 2
                              Store 128 366
             367:          10 Load 359
             368:          14 Load 361
             369:          18 SampledImage 367 368
             370:   24(fvec4) Load 70
             371:   20(fvec2) VectorShuffle 370 370 0 1
             372:   24(fvec4) ImageSampleImplicitLod 369 371
             373:    7(fvec3) VectorShuffle 372 372 0 1 2
                              Store 284 373
             375:          10 Load 359
             376:          14 Load 361
             377:          18 SampledImage 375 376
             378:   24(fvec4) Load 28
             379:   20(fvec2) VectorShuffle 378 378 0 1
             380:   24(fvec4) ImageSampleImplicitLod 377 379
             381:    7(fvec3) VectorShuffle 380 380 0 1 2
                              Store 374 381
             382:          10 Load 359
             383:          14 Load 361
             384:          18 SampledImage 382 383
             385:   24(fvec4) Load 28
             386:   20(fvec2) VectorShuffle 385 385 2 3
             387:   24(fvec4) ImageSampleImplicitLod 384 386
             388:    7(fvec3) VectorShuffle 387 387 0 1 2
             389:   24(fvec4) Load 28
             390:   24(fvec4) VectorShuffle 389 388 4 5 6 3
                              Store 28 390
             391:          10 Load 359
             392:          14 Load 361
             393:          18 SampledImage 391 392
             394:   24(fvec4) Load 70
             395:   20(fvec2) VectorShuffle 394 394 2 3
             396:   24(fvec4) ImageSampleImplicitLod 393 395
             397:    7(fvec3) VectorShuffle 396 396 0 1 2
             398:   24(fvec4) Load 70
             399:   24(fvec4) VectorShuffle 398 397 4 5 6 3
                              Store 70 399
             400:    7(fvec3) Load 128
             401:    7(fvec3) FNegate 400
             402:    7(fvec3) Load 284
             403:    7(fvec3) FAdd 401 402
                              Store 284 403
             404:    7(fvec3) Load 128
             405:    7(fvec3) FNegate 404
             406:    7(fvec3) Load 374
             407:    7(fvec3) FAdd 405 406
                              Store 374 407
             408:    7(fvec3) Load 284
             409:    7(fvec3) ExtInst 1(GLSL.std.450) 4(FAbs) 408
             410:    7(fvec3) Load 374
             411:    7(fvec3) ExtInst 1(GLSL.std.450) 4(FAbs) 410
             412:    7(fvec3) FAdd 409 411
                              Store 284 412
             413:    7(fvec3) Load 128
             414:    7(fvec3) FNegate 413
             415:   24(fvec4) Load 28
             416:    7(fvec3) VectorShuffle 415 415 0 1 2
             417:    7(fvec3) FAdd 414 416
             418:   24(fvec4) Load 28
             419:   24(fvec4) VectorShuffle 418 417 4 5 6 3
                              Store 28 419
             420:   24(fvec4) Load 28
             421:    7(fvec3) VectorShuffle 420 420 0 1 2
             422:    7(fvec3) ExtInst 1(GLSL.std.450) 4(FAbs) 421
             423:    7(fvec3) Load 284
             424:    7(fvec3) FAdd 422 423
             425:   24(fvec4) Load 28
             426:   24(fvec4) VectorShuffle 425 424 4 5 6 3
                              Store 28 426
             427:    7(fvec3) Load 128
             428:    7(fvec3) FNegate 427
             429:   24(fvec4) Load 70
             430:    7(fvec3) VectorShuffle 429 429 0 1 2
             431:    7(fvec3) FAdd 428 430
             432:   24(fvec4) Load 70
             433:   24(fvec4) VectorShuffle 432 431 4 5 6 3
                              Store 70 433
             434:   24(fvec4) Load 28
             435:    7(fvec3) VectorShuffle 434 434 0 1 2
             436:   24(fvec4) Load 70
             437:    7(fvec3) VectorShuffle 436 436 0 1 2
             438:    7(fvec3) ExtInst 1(GLSL.std.450) 4(FAbs) 437
             439:    7(fvec3) FAdd 435 438
             440:   24(fvec4) Load 28
             441:   24(fvec4) VectorShuffle 440 439 4 5 6 3
                              Store 28 441
             442:     56(ptr) AccessChain 28 55
             443:    6(float) Load 442
             444:     56(ptr) AccessChain 28 68
             445:    6(float) Load 444
             446:    6(float) FAdd 443 445
             447:     56(ptr) AccessChain 28 68
                              Store 447 446
             448:     56(ptr) AccessChain 28 58
             449:    6(float) Load 448
             450:     56(ptr) AccessChain 28 68
             451:    6(float) Load 450
             452:    6(float) FAdd 449 451
             453:     56(ptr) AccessChain 28 68
                              Store 453 452
             454:     56(ptr) AccessChain 28 68
             455:    6(float) Load 454
             457:     46(ptr) AccessChain 33 456
             458:    6(float) Load 457
             459:    6(float) FMul 455 458
             460:     56(ptr) AccessChain 28 68
                              Store 460 459
             461:     56(ptr) AccessChain 28 68
             462:    6(float) Load 461
             463:    6(float) ExtInst 1(GLSL.std.450) 4(FAbs) 462
             464:    6(float) ExtInst 1(GLSL.std.450) 30(Log2) 463
             465:     56(ptr) AccessChain 28 68
                              Store 465 464
             466:     56(ptr) AccessChain 28 68
             467:    6(float) Load 466
             469:     46(ptr) AccessChain 33 468
             470:    6(float) Load 469
             471:    6(float) FMul 467 470
             472:     56(ptr) AccessChain 28 68
                              Store 472 471
             473:     56(ptr) AccessChain 28 68
             474:    6(float) Load 473
             475:    6(float) ExtInst 1(GLSL.std.450) 29(Exp2) 474
             476:     56(ptr) AccessChain 28 68
                              Store 476 475
             477:    6(float) Load 60
             478:     56(ptr) AccessChain 28 68
             479:    6(float) Load 478
             480:    6(float) ExtInst 1(GLSL.std.450) 40(FMax) 477 479
                              Store 60 480
             481:    6(float) Load 60
             482:    6(float) ExtInst 1(GLSL.std.450) 37(FMin) 481 29
                              Store 60 482
             484:     46(ptr) AccessChain 33 483
             485:    6(float) Load 484
             486:    6(float) FNegate 485
             487:    6(float) FAdd 486 29
             488:     56(ptr) AccessChain 28 68
                              Store 488 487
             489:    6(float) Load 60
             490:     46(ptr) AccessChain 33 483
             491:    6(float) Load 490
             492:    6(float) FNegate 491
             493:    6(float) FAdd 489 492
                              Store 60 493
             494:     56(ptr) AccessChain 28 68
             495:    6(float) Load 494
             496:    6(float) FDiv 29 495
             497:     56(ptr) AccessChain 28 68
                              Store 497 496
             498:    6(float) Load 60
             499:     56(ptr) AccessChain 28 68
             500:    6(float) Load 499
             501:    6(float) FMul 498 500
                              Store 60 501
             502:    6(float) Load 60
             503:    6(float) ExtInst 1(GLSL.std.450) 43(FClamp) 502 53 29
                              Store 60 503
             504:    6(float) Load 60
             506:    6(float) FMul 504 505
             508:    6(float) FAdd 506 507
             509:     56(ptr) AccessChain 28 68
                              Store 509 508
             510:    6(float) Load 60
             511:    6(float) Load 60
             512:    6(float) FMul 510 511
                              Store 60 512
             513:    6(float) Load 60
             514:     56(ptr) AccessChain 28 68
             515:    6(float) Load 514
             516:    6(float) FMul 513 515
                              Store 60 516
             517:     56(ptr) AccessChain 78 68
             518:    6(float) Load 517
             519:    6(float) Load 60
             520:    6(float) FMul 518 519
                              Store 60 520
             522:     46(ptr) AccessChain 33 521 163
             523:    6(float) Load 522
             524:     56(ptr) AccessChain 28 68
                              Store 524 523
             525:     56(ptr) AccessChain 28 68
             526:    6(float) Load 525
             527:    6(float) ExtInst 1(GLSL.std.450) 43(FClamp) 526 53 29
             528:     56(ptr) AccessChain 28 68
                              Store 528 527
             530:    7(fvec3) Load 9
             531:    7(fvec3) FNegate 530
             532:     36(ptr) AccessChain 33 521
             533:   24(fvec4) Load 532
             534:    7(fvec3) VectorShuffle 533 533 0 1 2
             535:    7(fvec3) FAdd 531 534
                              Store 529 535
             536:    7(fvec3) Load 529
             537:   24(fvec4) Load 28
             538:    7(fvec3) VectorShuffle 537 537 0 0 0
             539:    7(fvec3) FMul 536 538
             540:   24(fvec4) Load 28
             541:   24(fvec4) VectorShuffle 540 539 4 5 6 3
                              Store 28 541
             542:    6(float) Load 60
             543:    7(fvec3) CompositeConstruct 542 542 542
             544:   24(fvec4) Load 28
             545:    7(fvec3) VectorShuffle 544 544 0 1 2
             546:    7(fvec3) FMul 543 545
             547:    7(fvec3) Load 9
             548:    7(fvec3) FAdd 546 547
             549:   24(fvec4) Load 159
             550:   24(fvec4) VectorShuffle 549 548 4 5 6 3
                              Store 159 550
             551:    164(ptr) AccessChain 159 163
                              Store 551 29
                              Return
                              FunctionEnd

Disassembly for Hull:
Not present.



 }
}
}