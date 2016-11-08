Shader "Transparent/Cutout/Transparent" {
	Properties {
		_Color ("Color", Color) = (1.0,1.0,1.0,0.0)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
	}
	SubShader {
		Tags {  "Queue" = "Transparent" 
				"IgnoreProjector"="True"
				"RenderType"="Fade" }
		LOD 2000
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types

		#pragma surface surf Standard fullforwardshadows alpha:fade


		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		fixed4 _Color;
		fixed _Cutoff;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			fixed4 lc = _LightColor0;
			o.Albedo = c.rgb;
			// Metallic and smoothness come from slider variables
			if(lc.a > _Cutoff)
				o.Alpha = lc.a ;//* 0.5;//c.a;
			else o.Alpha = 0.0;

		}
		ENDCG
	}
	FallBack "Transparent/VertexLit"
}
