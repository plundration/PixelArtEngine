Shader "Custom/Sprite_Billboard" {
     Properties
     {
         _SpriteTex ("Sprite Texture", 2D) = "white" {}
         _Color ("Tint", Color) = (1,1,1,1)
         [MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
         Scale ("Scale", Float) = 1
     }
 
     SubShader
     {
         Tags
         { 
             "Queue"="Transparent"
             "SortingLayer"="Resources_Sprites" 
             "IgnoreProjector"="True" 
             "RenderType"="Transparent" 
             "PreviewType"="Plane"
             "CanUseSpriteAtlas"="True"
             "DisableBatching" = "True" // important
         }
 
         Cull Off
         Lighting Off
         ZWrite Off
         Blend One OneMinusSrcAlpha
 
         Pass
         {
         CGPROGRAM
             #pragma vertex vert
             #pragma fragment frag
             #pragma target 2.0
             #pragma multi_compile _ PIXELSNAP_ON
             #pragma multi_compile _ ETC1_EXTERNAL_ALPHA
             #include "UnityCG.cginc"
 
             struct appdata_t
             {
                 float4 vertex   : POSITION;
                 float4 color    : COLOR;
                 float2 texcoord : TEXCOORD0;
                 UNITY_VERTEX_INPUT_INSTANCE_ID
             };
 
             struct v2f
             {
                 float4 vertex   : SV_POSITION;
                 fixed4 color    : COLOR;
                 float2 texcoord  : TEXCOORD0;
                 UNITY_VERTEX_OUTPUT_STEREO
             };
             
             fixed4 _Color;
             float Scale;
 
             v2f vert(appdata_t IN)
             {
                 v2f OUT;
                 UNITY_SETUP_INSTANCE_ID(IN);
                 UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(OUT);
                 OUT.texcoord = IN.texcoord;
                 OUT.color = IN.color * _Color;

                 OUT.vertex = mul(UNITY_MATRIX_P, mul(UNITY_MATRIX_MV, float4(0, 0, 0, 1)) - float4(IN.vertex.x*Scale,IN.vertex.y*Scale*-1,IN.vertex.z*Scale,0));
 
                 return OUT;
             }
 
             sampler2D _SpriteTex;
             sampler2D _AlphaTex;
 
             fixed4 frag(v2f IN) : SV_Target
             {
                 fixed4 c = tex2D (_SpriteTex, IN.texcoord) * IN.color;
                 c.rgb *= c.a;
                 return c;
             }
         ENDCG
         }
     }
 }