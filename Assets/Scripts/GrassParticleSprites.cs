using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.ParticleSystemModule;

public class GrassParticleSprites : MonoBehaviour
{
    public List<Mesh> meshes;

    // Start is called before the first frame update
    void Start()
    {
        var terrain = GetComponent<Terrain>() as Terrain;

        Vector3 tpos = terrain.transform.position;
        var terraindata = terrain.terrainData as TerrainData;
        int resolution = terraindata.heightmapResolution;
        Vector3 scale = terraindata.heightmapScale;

        ParticleSystem ps = GetComponent<ParticleSystem>();
        EmitParams grassParams = new EmitParams();
        EmitParams flowerParams = new EmitParams();        

        for (int x = 0; x < resolution; x++) {
            for (int z = 0; z < resolution; z++) {
                if (Random.value > 0.995) {
                    var position = new Vector3(scale.x * x + tpos.x, terraindata.GetHeight(x, z) + tpos.y + 0.05f, scale.z * z + tpos.z);
                    Instantiate(grass, position, Quaternion.identity);
                }
            }
        }


    }

    // Update is called once per frame
    void Update()
    {

    }
}
