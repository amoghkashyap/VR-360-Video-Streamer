
#ifdef HAS_MULTIVIEW
   vec4 pos = u_mv_[gl_ViewID_OVR] * vertex.local_position;
#else
   vec4 pos = u_mv * vertex.local_position;
#endif
    vertex.viewspace_position = pos.xyz / pos.w;

#ifdef HAS_MULTIVIEW
	vertex.viewspace_normal = normalize((u_mv_it_[gl_ViewID_OVR] * vertex.local_normal).xyz);
#else
	vertex.viewspace_normal = normalize((u_mv_it * vertex.local_normal).xyz);
#endif
   vertex.view_direction = normalize(-vertex.viewspace_position);
#ifdef HAS_a_texcoord
    diffuse_coord = a_texcoord.xy;
    specular_coord = a_texcoord.xy;
    ambient_coord = a_texcoord.xy;
#ifdef HAS_normalTexture
    normal_coord = a_texcoord.xy;
#endif
#ifdef HAS_lightmapTexture
    lightmap_coord = a_texcoord.xy;
#endif
#endif
