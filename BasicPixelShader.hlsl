#include"BasicType.hlsli"
Texture2D<float4> tex:register(t0);//0番スロットに設定されたテクスチャ
SamplerState smp:register(s0);//0番スロットに設定されたサンプラ
//cbuffer ColorKeySettings : register(b0)
//{
//    float3 GreenColor; // キーイングする緑の色
//    float Threshold; // 許容する色差の範囲
//}

float4 BasicPS(BasicType input ) : SV_TARGET{
    float4 tmp = tex.Sample(smp, input.uv);
    if (tmp.y >= 0.9f && tmp.x < 0.1f && tmp.z < 0.1f)
    {
        return float4(0.0f, 0.0f, 0.0f, 0.0f);
    }
    return tmp;
    //
    //float4 color = tex.Sample(smp, input.uv);
    //
    //// グリーンバックの近い色を透明にする
    //float3 diff = abs(color.rgb - GreenColor);
    //if (diff.r + diff.b < Threshold)
    //{
    //    color.a = 0.0; // 透明にする
    //}
    //
    //return color;
}