using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DayNightController : MonoBehaviour
{
    [Range(0f, 24f)]
    public float TimeOfDay;
    public float TimeScale;
    [Range(0f,90f)]
    public float MaxAngle;


    Transform lightTransform;

    void Start()
    {
        lightTransform = GetComponent<Transform>();
    }

    void Update()
    {
        TimeOfDay += Time.deltaTime * TimeScale;

        if (TimeOfDay > 24f) TimeOfDay = 0f;

        float x = -Mathf.Cos(TimeOfDay*2f*Mathf.PI/24f)*MaxAngle;
        float y = (TimeOfDay - 6f) * 360f / 24f - 90f;
        lightTransform.rotation = Quaternion.Euler(x, y, 0);

        Shader.SetGlobalFloat("_GLOBAL_TIME", TimeOfDay);
    }

}
