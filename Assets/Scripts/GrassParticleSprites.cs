using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEngine.ParticleSystem;

public class GrassParticleSprites : MonoBehaviour
{
    public List<Mesh> meshes;

    // Start is called before the first frame update
    void Start()
    {
        Terrain terrain = GetComponent<Terrain>();

        Vector3 tpos = terrain.transform.position;
        var terraindata = terrain.terrainData as TerrainData;
        int resolution = terraindata.heightmapResolution;
        Vector3 scale = terraindata.heightmapScale;

        ParticleSystem ps = GetComponent<ParticleSystem>();
        EmitParams grassParams = new EmitParams();


        for (int x = 0; x < resolution; x++) {
            for (int z = 0; z < resolution; z++) {
                if (Random.value > 0.95) {
                    var position = new Vector3(scale.x * x + tpos.x, terraindata.GetHeight(x, z) + tpos.y + 0.05f, scale.z * z + tpos.z);
                    
                    grassParams.position = position;
                    ps.Emit(grassParams,1);
                    Debug.Log("Emit");
                }
            }
        }


    }

    // Update is called once per frame
    void Update()
    {

    }
}
