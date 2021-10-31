using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [Range(0,0.1f)] 
    public float speed = 0.01f;
    Transform tr;

    void Start()
    {
        tr = GetComponent<Transform>();
    }

    void Update()
    {
        if (Input.GetKey(KeyCode.W)) {
            var vector = tr.forward;
            vector.y = 0;
            vector *= speed;
            tr.position += vector;
        }
        if (Input.GetKey(KeyCode.S)) {
            var vector = tr.forward;
            vector.y = 0;
            vector *= speed;
            tr.position -= vector;
        }
        if (Input.GetKey(KeyCode.A)) {
            var vector = tr.right;
            vector.y = 0;
            vector *= speed / 2;
            tr.position -= vector;
        }
        if (Input.GetKey(KeyCode.D)) {
            var vector = tr.right;
            vector.y = 0;
            vector *= speed / 2;
            tr.position += vector;
        }
    }
}
