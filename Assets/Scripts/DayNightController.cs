using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DayNightController : MonoBehaviour
{
    [Range(0f, 24f)]
    public float TimeOfDay;
    public float TimeScale;

    Transform lightTransform;

    void Start()
    {
        lightTransform = GetComponent<Transform>();
    }

    void Update()
    {
        TimeOfDay += Time.deltaTime * TimeScale;
        if (TimeOfDay > 24f) TimeOfDay = 0;

        var rot = lightTransform.rotation;
        rot.x = (TimeOfDay - 6f) * 360f/24f;
        lightTransform.rotation = Quaternion.Euler(rot.x,rot.y,rot.z);

        Shader.SetGlobalFloat("_GLOBAL_TIME", TimeOfDay);
    }

}
