#include"BasicType.hlsli"
Texture2D<float4> tex:register(t0);//0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp:register(s0);//0�ԃX���b�g�ɐݒ肳�ꂽ�T���v��
//cbuffer ColorKeySettings : register(b0)
//{
//    float3 GreenColor; // �L�[�C���O����΂̐F
//    float Threshold; // ���e����F���͈̔�
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
    //// �O���[���o�b�N�̋߂��F�𓧖��ɂ���
    //float3 diff = abs(color.rgb - GreenColor);
    //if (diff.r + diff.b < Threshold)
    //{
    //    color.a = 0.0; // �����ɂ���
    //}
    //
    //return color;
}